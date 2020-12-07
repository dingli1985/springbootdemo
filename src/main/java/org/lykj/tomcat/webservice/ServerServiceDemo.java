package org.lykj.tomcat.webservice;

import org.lykj.tomcat.entity.ReturnValue;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService(name = "ServerServiceDemo", targetNamespace = "http://org.lykj.ws")
public interface ServerServiceDemo {
    @WebMethod
    String emrService(@WebParam String data);

    @WebMethod
    String getAuditTaskService(@WebParam String RequestInfo);

    @WebMethod
    String IsHandler(@WebParam String username,@WebParam String mobileNumber,@WebParam String orderCode);

    @WebMethod
    String IsHandlerHis(@WebParam String username,@WebParam String mobileNumber,@WebParam String orderCode);

    @WebMethod
    public ReturnValue authenticateStaticPassword(@WebParam String uid,@WebParam String pwd);
}