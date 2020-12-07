package org.lykj.tomcat.web;

import com.asiainfo.uap.util.des.EncryptInterface;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@Controller
@Slf4j
@ResponseBody
public class NewDesEncodeController {

    @GetMapping("/enc/abc")
    public String getEncodeStr(@RequestParam(value="operCode",required = false) String operCode, @RequestParam(value="subAcct",required = false) String subAcct){
        log.info("operCode ["+operCode+"]");
        log.info("subAcct ["+subAcct+"]");
        String encOperCode=EncryptInterface.desEncryptData(operCode);
        String encSubAcct=EncryptInterface.desEncryptData(subAcct);
        return encOperCode+"=="+encSubAcct;
    }

}
