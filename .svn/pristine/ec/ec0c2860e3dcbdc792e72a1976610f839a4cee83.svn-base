package kr.or.ddit.controller.exam;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/exam")
public class GalleryController {
    private static final Logger logger = LoggerFactory.getLogger(GalleryController.class);
    
    @RequestMapping(value = "/goGallery", method = RequestMethod.GET)
    public String goGallery() {
        logger.info("goGallery -in");
        
        return "/exam/gallery";
    }
    
    @RequestMapping(value = "/showImg", method = RequestMethod.GET)
    public ResponseEntity<byte[]> showImg(String fileName) throws Exception {
        logger.info("showImg -in");
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
        HttpHeaders headers = new HttpHeaders();
        String path = "C:\\ddit\\Framwork\\Spring\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\DevProject\\resources\\mybox\\image"; 
        
        try {
            in = new FileInputStream(path + "\\" + fileName);
            headers.setContentType(MediaType.IMAGE_JPEG);
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch(IOException e) {
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
            e.printStackTrace();
        } finally {
            in.close();
        }
        
        return entity;
    }
}
