package ro.utcn.amqp;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.context.Context;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@RestController
public class Controller {

    private EmailSender emailSender;

    public Controller(EmailSender emailSender) {
        this.emailSender = emailSender;
    }

    private final String authorizationToken = "1bf38fac-897e-40bd-8f3c-38bf247544f93196e235-ec58-43b1-b5b3-e9637822a1b5";


    @PostMapping("/create")
    public ResponseEntity<MessageDto> sendRegisterEmail (@RequestHeader String token, @RequestBody UserDto userDto) {

        if(!token.equals(authorizationToken)){
            MessageDto dto = new MessageDto();
            dto.setError("You are not authorized!");
            dto.setMessage("Bad authorization token.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(dto);
        }

        try{
            UserDtoValidator.validateUserDto(userDto);
        }
        catch(Exception e){
            MessageDto dto = new MessageDto();
            dto.setError(e.getMessage());
            dto.setMessage("Please, enter valid credentials");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(dto);
        }

        emailSender.sendRegisterEmailToUser(userDto);

        MessageDto dto = new MessageDto();
        dto.setError("None");
        dto.setMessage("Successfully created new user! Email confirmation sent.");
        return ResponseEntity.status(HttpStatus.OK).body(dto);
    }

}
