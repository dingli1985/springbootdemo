package org.lykj.tomcat.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
public class SessionRequest extends HttpServlet {

    @GetMapping("/ams/gold/SessionRequest")
    public String sessionRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // requestInfo为请求消息XML报文，参见上述定义
        String requestInfo = "<?xml version='1.0' encoding='UTF-8'?>" +
                " <SESSIONCHECK>" +
                " <HEAD>" +
                " <OPERATEID>10180</OPERATEID>" +
                " <SVCSN>111</SVCSN>" +
                " <TIMESTAMP>20121127000000</TIMESTAMP>" +
                " <SERVICEID>SHNGCRM</SERVICEID>" +
                " </HEAD>" +
                " <BODY>" +
                " <USERID>1</USERID>" +
                " <SESSIONID>2</SESSIONID>" +
                " </BODY>" +
                " </SESSIONCHECK>";
        String strUrl="http://127.0.0.1:8090/ams/gold/gold/SeessionCheck";
        String retMsg=getHttpResponse(strUrl,requestInfo);
        // 解析XML报文（rtnMsg），参见返回XML报文格式
        return retMsg;
    }

    public String getHttpResponse(String strUrl,String requestInfo) throws IOException {
        HttpURLConnection httpURLConnection = null;
        java.net.URL url = new java.net.URL(strUrl);
        java.net.URLConnection urlcn = url.openConnection();
        httpURLConnection = (HttpURLConnection) urlcn;
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setConnectTimeout(30000);
        httpURLConnection.setReadTimeout(30000);
        httpURLConnection.setRequestProperty("content-type", "text/html");
        System.setProperty("sun.net.client.defaultConnectTimeout", "" + 30);
        System.setProperty("sun.net.client.defaultReadTimeout", "" + 30);
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setDoInput(true);
        OutputStreamWriter osw = new OutputStreamWriter(httpURLConnection
                .getOutputStream(), "UTF-8");
        osw.write(requestInfo);
        osw.flush();
        osw.close();


        BufferedReader rd = new BufferedReader(new InputStreamReader(
                httpURLConnection.getInputStream()));
        String rtnMsg = "";
        String line;
        while ((line = rd.readLine()) != null) {
            rtnMsg = rtnMsg + line;
        }
        rd.close();
        httpURLConnection.disconnect();
        return  rtnMsg;
    }
}
