package ro.utcn.amqp;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.catalina.User;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

@Component
public class QueueListener {

    private EmailSender emailSender;

    public QueueListener(EmailSender emailSender) {
        this.emailSender = emailSender;
    }

    @RabbitListener(queues = "grupa8-queue")
    public void listen(String json) {
        System.out.println("Message read from myQueue : " + json);

        try {
            UserDto userDto = new ObjectMapper().readValue(json, UserDto.class);

            UserDtoValidator.validateUserDto(userDto);
            UserDtoValidator.validateUserId(userDto.getId());

            emailSender.sendEditAccountEmailToUser(userDto);

        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

}
