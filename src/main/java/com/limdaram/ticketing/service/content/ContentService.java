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

//            // 파일 저장
//            // board id 이름의 새폴더 만들기
//            // File folder = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());
//            folder1.mkdirs();
//            File dest = new File(folder1, uuid);
//
//            // CheckException을 RuntimeException으로 바꿔서 던져주는 역할
//            try {
//                file1.transferTo(dest); // checkException을 발생시킴
//            } catch (Exception e) {
//                // @Transactional은 RuntimeException에서만 rollback 됨
//                e.printStackTrace();
//                throw new RuntimeException(e);
//            }

            uploadPosterFile(content, file1, uuid);
        }

        for (MultipartFile file : file2) {
            if (file != null && file.getSize() > 0) {
//                File folder2 = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());

                String uuid2 = UUID.randomUUID().toString() + ".jpg";

                // db에 파일 정보 저장(contentid, filename)
                mapper.insertFile2(content.getContentId(), uuid2);

                // 파일 저장// board id 이름의 새폴더 만들기
                folder1.mkdirs();
                File dest2 = new File(folder1, uuid2);

                // CheckException을 RuntimeException으로 바꿔서 던져주는 역할
                try {
                    file.transferTo(dest2); // checkException을 발생시킴
                } catch (Exception e) {
                    // @Transactional은 RuntimeException에서만 rollback 됨
                    e.printStackTrace();
                    throw new RuntimeException(e);
                }
            }
        }
        System.out.println(content);
        return cnt;
    }

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

    public List<ContentDto> listContent(ContentDto contentDto) {
        int countAll = mapper.countAll();

        contentDto.setCountContent(countAll);

        return mapper.list();
    }

    public ContentDto get(int contentId) {
        return mapper.select(contentId);
    }

    //    컨텐츠수정
    public int update(
            ContentDto content,
            MultipartFile addPosterFile,
            MultipartFile[] addDetailFiles,
            String removePosterFile,
            List<String> removeDetailFiles) {
//        System.out.println("removeDetailFiles: " + removeDetailFiles);
//        System.out.println("addDetailFiles: " + addDetailFiles);
//        System.out.println("addPosterFile: " + addPosterFile);

        int contentId = content.getContentId();

        // 포스터 파일 제거
        if (removePosterFile != null) {
            // db에서 파일 이름 제거
            mapper.deletePosterByContentId(contentId);
//            // 저장소에서 파일 제거
//            String path = "/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + contentId + "/" + removePosterFile;
//            File file = new File(path);
//            file.delete();

            // s3 저장소에서 포스트 파일 제거
            String contentPosterName = content.getContentPosterName();
            deletePosterFile(contentId, contentPosterName);
        }
        // 포스터 파일 추가
        if (addPosterFile != null && addPosterFile.getSize() > 0) {
            // 1. 포스터 파일 제거 먼저 실행
            String posterName = mapper.select(contentId).getContentPosterName();
            System.out.println("posterName: " + posterName);
            // 저장소에서 제거
            String path = "/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + contentId + "/" + posterName;
            File file = new File(path);
            file.delete();
            // db에서 파일 이름 제거
            mapper.deletePosterByContentId(contentId);



            // 2. 파일 추가 실행
            // 경로 설정
            File folder = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());

            // 파일 이름 uuid로 설정
            String PosterNameUuid = UUID.randomUUID().toString() + ".jpg";

            // db에 파일 정보 저장(contentid, filename)
            mapper.insertFile(content.getContentId(), PosterNameUuid);

            // 저장소에 파일 저장
//            File folder = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());
            File dest = new File(folder, PosterNameUuid);

            // CheckException을 RuntimeException으로 바꿔서 던져주는 역할
            try {
                addPosterFile.transferTo(dest); // checkException을 발생시킴
            } catch (Exception e) {
                // @Transactional은 RuntimeException에서만 rollback 됨
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }


        // removeDetailFiles에 있는 파일명으로
        // 파일 체크 됐을 때
        if (removeDetailFiles != null) {
            for (String removeDetailFile : removeDetailFiles) {
                // 1. contentDetail 테이블에서 record 지우기
//                System.out.println("contentId, DetailFileName: " + contentId + ", " + removeDetailFile);
                mapper.deleteByContentIdAndDetailName(contentId, removeDetailFile);
                // 2. 저장소에 있는 실제 파일 지우기
                String path = "/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + contentId + "/" + removeDetailFile;
                File file = new File(path);
//                System.out.println("path: " + file);
                file.delete();
            }
        }
        // 추가 파일 있을 때
        if (addDetailFiles != null) {
            for (MultipartFile DetailFile : addDetailFiles) {
                if (DetailFile != null && DetailFile.getSize() > 0) {
                    // 파일 테이블에 파일명 추가
                    String uuid = UUID.randomUUID().toString() + ".jpg";
                    mapper.insertFile2(content.getContentId(), uuid);

                    // 저장소에 실제 파일 추가
                    File folder = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());
                    folder.mkdirs();
                    File dest = new File(folder, uuid);

                    // CheckException을 RuntimeException으로 바꿔서 던져주는 역할
                    try {
                        DetailFile.transferTo(dest); // checkException을 발생시킴
                    } catch (Exception e) {
                        // @Transactional은 RuntimeException에서만 rollback 됨
                        e.printStackTrace();
                        throw new RuntimeException(e);
                    }
                }
            }
        }
        return mapper.update(content);
    }

    //    컨텐츠삭제
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

        if (contentPosterName != null) {
            // s3 저장소의 파일 지우기
            deletePosterFile(contentId, contentPosterName);

        }

        // db의 이미지 파일 records 지우기
        mapper.deletePosterByContentId(contentId);
        mapper.deleteDetailByContentId(contentId);

        // 게시물의 댓글 지우기
        // replyMapper.deleteByContentId(ContentId);

        // 게시글 지우기
        return mapper.delete(contentId);
    }

    private void deletePosterFile(int contentId, String contentPosterName) {
        String key = "prj1/board/" + contentId + "/" + contentPosterName;
        DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
                .bucket(bucketName)
                .key(key)
                .build();
        s3Client.deleteObject(deleteObjectRequest);
    }

    public ContentDto reservation(int contentId) {

        return mapper.select(contentId);
    }
}
