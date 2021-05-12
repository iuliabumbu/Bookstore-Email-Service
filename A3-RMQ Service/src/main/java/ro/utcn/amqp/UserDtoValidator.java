package ro.utcn.amqp;

import org.thymeleaf.util.StringUtils;

public class UserDtoValidator {

    public static void validateUserDto(UserDto user){
        if(StringUtils.isEmpty(user.getEmail()) || (!user.getEmail().contains("@yahoo") && !user.getEmail().contains("@gmail"))){
            throw new InvalidParameterException("Invalid email");
        }

        if(StringUtils.isEmpty(user.getPassword())|| user.getPassword().length() < 6){
            throw new InvalidParameterException("Invalid password");
        }

        if(StringUtils.isEmpty(user.getName())){
            throw new InvalidParameterException("Invalid name");
        }

        if(StringUtils.isEmpty(user.getSurname())){
            throw new InvalidParameterException("Invalid surname");
        }

        if(StringUtils.isEmpty(user.getPhoneNumber())|| user.getPhoneNumber().length() != 10
                || !user.getPhoneNumber().matches("[0-9]+")){
            throw new InvalidParameterException("Invalid phone number");
        }
    }

    public static void validateUserId(String id){
        if(StringUtils.isEmpty(id)){
            throw new InvalidParameterException("Invalid id");
        }
    }
}
