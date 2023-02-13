package kr.or.ddit.controller.exam;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/exam")
public class LibraryController {
    private static final Logger logger = LoggerFactory.getLogger(LibraryController.class);
    
    @RequestMapping(value = "/library", method = RequestMethod.POST)
    public ResponseEntity<Map<Integer, String>> getLibrary(String dirName, String innerDirName) {
        logger.info("getLibrary -in");
        logger.info("dirName = " + dirName);
        logger.info("innerDirName = " + innerDirName);
        
        String path = "C:\\ddit\\Framwork\\Spring\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\libaray\\mybox";
        File dir = new File(path);
        
        if (dirName != null) {
            dir = new File(path + "\\" + dirName);
        }
        
        if (innerDirName != null) {
            dir = new File(path + "\\" + dirName + "\\" + innerDirName);
        }
        
        String fileNames[] = dir.list();
        Map<Integer, String> map = new HashMap<Integer, String>();
        
        for (int i = 0; i < fileNames.length; i++) {
            System.out.println("fileName: " + fileNames[i]);
            map.put(i, fileNames[i]);
        }
        
        return new ResponseEntity<Map<Integer, String>>(map, HttpStatus.OK);
    }
    
}
