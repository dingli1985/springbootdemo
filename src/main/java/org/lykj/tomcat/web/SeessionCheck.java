package org.lykj.tomcat.web;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class SeessionCheck{
    private static final long serialVersionUID = 1L;

    @PostMapping("/ams/gold/gold/SeessionCheck")
    public String seessionCheck(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StringBuffer sb = new StringBuffer();
        String s = null;
        BufferedReader br = new BufferedReader(new InputStreamReader(request
                .getInputStream(), "utf-8"));
        while ((s = br.readLine()) != null) {
            sb.append(s).append("\n");
        }
        String requestMsg = sb.toString();
        log.info("request ["+request+"]");
        try {
            String appCode = getAppCode(requestMsg);
            log.info("appCode ["+appCode+"]");

        } catch (JDOMException e) {
            e.printStackTrace();
        }
        // 解析请求的XML消息
        // 取得SESSIONID和USERID参数
        // 到对应服务器上验证SESSIONID是否存在并且与请求的用户标识（USERID）对应
        // 根据验证结果组织返回报文给客户端
        return "<?xml version='1.0' encoding= 'UTF-8'?>" + "<SESSIONCHECK>"
                + "<HEAD>" + "<OPERATEID>123</OPERATEID>"
                + "<SVCSN>12345678</SVCSN>" + "<TIMESTAMP>20120502</TIMESTAMP>"
                + "<SERVICEID>UAP</SERVICEID>" + "</HEAD>" + "<BODY>"
                + "<RSP>0</RSP>" + "<ERRDESC></ERRDESC>"
                + "</BODY></SESSIONCHECK>";

    }

    public String getAppCode(String xmlStr) throws JDOMException, IOException {
        Document doc = build(xmlStr);
        Element root = getBody(doc);
        List _head = root.getChildren("HEAD");
        Element head = (Element) _head.get(0);
        return head.getChildText("APPCODE");
    }

    public Element getBody(Document doc) {
        return doc.getRootElement();
    }

    public Document build(String xmlStr) throws JDOMException, IOException {
        SAXBuilder builder = new SAXBuilder(false);
        return builder.build(new ByteArrayInputStream(xmlStr.getBytes()));
    }
}
