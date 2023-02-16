package fr.digiwin.module.espacecollection.keepeek.exception;

public class KeepeekException extends Exception {
    
    public int code = -1;
    
    public KeepeekException(String msg){
        super(msg);
    }

    public KeepeekException(String msg, Throwable cause){
        super(msg, cause);
    }
    
    public KeepeekException(String msg, int code){
        super(code + " ,msg: " + msg);
        this.code = code;
    }
}