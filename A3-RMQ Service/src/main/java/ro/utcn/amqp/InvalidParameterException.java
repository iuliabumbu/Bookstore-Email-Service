package ro.utcn.amqp;

public class InvalidParameterException extends RuntimeException{

    public InvalidParameterException(String message){
        super(message);
    }
}