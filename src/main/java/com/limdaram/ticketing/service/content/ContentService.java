package com.limdaram.ticketing.service.content;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.mapper.content.ContentMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ContentService {

    @Setter(onMethod_ = @Autowired)
    private ContentMapper mapper;

    @Setter(onMethod_ = @Autowired)
    private S3Client s3Client;

    @Value("${aws.s3.bucket}")
    private String bucketName;

    public int register(
            ContentDto content,
            MultipartFile file1,
            MultipartFile[] file2) {
        // db에 게시물 정보 저장
        int cnt = mapper.insert(content);

        File folder1 = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());

        if (file1 != null && file1.getSize() > 0) {

            String uuid = UUID.randomUUID().toString() + ".jpg";

            // db에 파일 정보 저장(contentid, filename)
            mapper.insertFile(content.getContentId(), uuid);


            uploadPosterFile(content, file1, uuid);
        }

            for (MultipartFile file : file2) {
                if (file != null && file.getSize() > 0) {
//                File folder2 = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());

                    String uuid = UUID.randomUUID().toString() + ".jpg";

                    // db에 파일 정보 저장(contentid, filename)
                    mapper.insertFile2(content.getContentId(), uuid);

//                    // 파일 저장// board id 이름의 새폴더 만들기
//                    folder1.mkdirs();
//                    File dest2 = new File(folder1, uuid);

//                    // CheckException을 RuntimeException으로 바꿔서 던져주는 역할
//                    try {
//                        file.transferTo(dest2); // checkException을 발생시킴
//                    } catch (Exception e) {
//                        // @Transactional은 RuntimeException에서만 rollback 됨
//                        e.printStackTrace();
//                        throw new RuntimeException(e);
//                    }

                    uploadDetailFiles(content, file, uuid);
                }
            }
//        System.out.println(content);
        return cnt;
    }

    // 총 게시물 개수 확인
    public List<ContentDto> listContent(ContentDto contentDto) {
        int countAll = mapper.countAll();

        contentDto.setCountContent(countAll);

        return mapper.list();
    }

    public ContentDto get(int contentId) {
        return mapper.select(contentId);
    }

    public List<ContentDto> selectContent() {
        return mapper.selectContent();
    }

    //    컨텐츠수정
    public int update(
            ContentDto content,
            MultipartFile addPosterFile,
            MultipartFile[] addDetailFiles,
            String removePosterName,
            List<String> removeDetailNames) {

        int contentId = content.getContentId();
//        String deletePosterName = mapper.select(contentId).getContentPosterName();
//        String deletePosterName = content.getContentPosterName();

        // 포스터 파일 제거
        if (removePosterName != null) {
//            // 저장소에서 파일 제거
//            String path = "/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + contentId + "/" + removePosterFile;
//            File file = new File(path);
//            file.delete();

            // s3 저장소에서 포스트 파일 제거
            removePosterFile(contentId, removePosterName);
            // db에서 파일 이름 제거
            mapper.deletePosterByContentId(contentId);
        }
        // 포스터 파일 추가
        if (addPosterFile != null && addPosterFile.getSize() > 0) {

            // 1. 포스터 파일 제거 먼저 실행
//            String posterName = mapper.select(contentId).getContentPosterName();
//            System.out.println("posterName: " + posterName);

//            // 저장소에서 제거
//            String path = "/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + contentId + "/" + posterName;
//            File file = new File(path);
//            file.delete();

            String deletePosterName = mapper.select(contentId).getContentPosterName();
//            System.out.println("contentPosterName: " + deletePosterName);
//            if (removePosterName != null) {
                // s3 저장소에서 파일 제거
                removePosterFile(contentId, deletePosterName);
                // db에서 파일 이름 제거
                mapper.deletePosterByContentId(contentId);
//            }

            // 2. 파일 추가 실행

//            // 로컬에 파일 저장 방법
//            // 경로 지정
//            File folder = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());
//            // 저장소에 파일 저장
////            File folder = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());
//            File dest = new File(folder, PosterNameUuid);
//
//            // CheckException을 RuntimeException으로 바꿔서 던져주는 역할
//            try {
//                addPosterFile.transferTo(dest); // checkException을 발생시킴
//            } catch (Exception e) {
//                // @Transactional은 RuntimeException에서만 rollback 됨
//                e.printStackTrace();
//                throw new RuntimeException(e);
//            }

            // s3 저장소에 파일 저장
            // 파일 이름 uuid로 설정
            String addPosterName = UUID.randomUUID().toString() + ".jpg";
            uploadPosterFile(content, addPosterFile, addPosterName);

            // db에 파일 정보 저장(contentId, filename)
            mapper.insertFile(content.getContentId(), addPosterName);

        }


        // removeDetailFiles에 있는 파일명으로
        // 파일 체크 됐을 때
        if (removeDetailNames != null) {
            for (String removeDetailName : removeDetailNames) {

                // s3 저장소에서 파일 지우기
                removeDetailFile(contentId, removeDetailName);

                // 1. contentDetail 테이블에서 record 지우기
//                System.out.println("contentId, DetailFileName: " + contentId + ", " + removeDetailFile);
                mapper.deleteByContentIdAndDetailName(contentId, removeDetailName);

                // s3 저장소에서 파일 지우기
                removeDetailFile(contentId, removeDetailName);

//                // 2. 저장소에 있는 실제 파일 지우기
//                String path = "/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + contentId + "/" + removeDetailName;
//                File file = new File(path);
////                System.out.println("path: " + file);
//                file.delete();
            }
        }
        // 추가 파일 있을 때
        if (addDetailFiles != null) {
            for (MultipartFile DetailFile : addDetailFiles) {
                if (DetailFile != null && DetailFile.getSize() > 0) {
                    // 파일 테이블에 파일명 추가
                    String uuid = UUID.randomUUID().toString() + ".jpg";
                    mapper.insertFile2(content.getContentId(), uuid);
                    // s3 저장소에 디테일 파일 추가
                    uploadDetailFiles(content, DetailFile, uuid);
                }
            }
        }
        return mapper.update(content);
    }

    public int remove(int contentId) {
//        // 저장소의 이미지 파일 지우기
//        String path = "/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + contentId;
//        File folder = new File(path);   // 폴더 만들기
//
//        File[] listFiles = folder.listFiles();  // 폴더안의 파일들
//
//        if (listFiles != null) {
//            for (File file : listFiles) {
//                file.delete();  // 파일 지우기
//            }
//            folder.delete();    // 폴더 지우기
//        }
        ContentDto content = mapper.select(contentId);

        String contentPosterName = content.getContentPosterName();
        List<String> removeDetailNames = content.getContentDetailName();

        if (contentPosterName != null) {
            // s3 저장소의 파일 지우기
            removePosterFile(contentId, contentPosterName);

        }

        if (removeDetailNames != null) {
            for (String removeDetailName : removeDetailNames) {
                removeDetailFile(contentId, removeDetailName);
            }
        }

        // db의 이미지 파일 records 지우기
        mapper.deletePosterByContentId(contentId);
        mapper.deleteDetailByContentId(contentId);

        // 게시물의 댓글 지우기
        // replyMapper.deleteByContentId(ContentId);

        // 게시글 지우기
        return mapper.delete(contentId);
    }

    private void removePosterFile(int contentId, String removePosterName) {
//        System.out.println("포스터네임" + removePosterName);
        String key = "prj1/board/" + contentId + "/" + removePosterName;
        DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
                .bucket(bucketName)
                .key(key)
                .build();
        s3Client.deleteObject(deleteObjectRequest);
    }

    private void removeDetailFile(int contentId, String removeDetailName) {
        String key = "prj1/board/" + contentId + "/" + removeDetailName;
        DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
                .bucket(bucketName)
                .key(key)
                .build();
        s3Client.deleteObject(deleteObjectRequest);
    }

    // 디테일 파일 함수
    private void uploadDetailFiles(ContentDto content, MultipartFile file, String uuid) {
        try {
            // s3에 디테일 파일 저장
            // 키 생성
            String key = "prj1/board/" + content.getContentId() + "/" + uuid;

            // putObjectRequest
            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(bucketName)
                    .key(key)
                    .acl(ObjectCannedACL.PUBLIC_READ)
                    .build();

            // requestBody
            RequestBody requestBody = RequestBody.fromInputStream(file.getInputStream(), file.getSize());

            // object(파일) 올리기
            s3Client.putObject(putObjectRequest, requestBody);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    // 포스터 파일 등록 함수
    private void uploadPosterFile(ContentDto content, MultipartFile file1, String uuid) {
        try {
            // s3에 파일 저장
            // 키 생성
            String key = "prj1/board/" + content.getContentId() + "/" + uuid;

            // putObjectRequest
            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(bucketName)
                    .key(key)
                    .acl(ObjectCannedACL.PUBLIC_READ)
                    .build();

            // requestBody
            RequestBody requestBody = RequestBody.fromInputStream(file1.getInputStream(), file1.getSize());

            // object(파일) 올리기
            s3Client.putObject(putObjectRequest, requestBody);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public ContentDto reservation(int contentId) {

        return mapper.select(contentId);
    }


}
