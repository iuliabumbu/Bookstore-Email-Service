package ro.utcn.amqp;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.List;

@Component
public class EmailSender {

    private EmailCfg emailCfg;

    public EmailSender(EmailCfg emailCfg) {
        this.emailCfg = emailCfg;
    }


    public void sendRegisterEmailToUser(UserDto userDto){

        // Create a mail sender
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(this.emailCfg.getHost());
        mailSender.setPort(this.emailCfg.getPort());
        mailSender.setUsername(this.emailCfg.getUsername());
        mailSender.setPassword(this.emailCfg.getPassword());

        // Create an email instance
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");

        String html = "<!doctype html>\n" +
                "<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\"\n" +
                "      xmlns:th=\"http://www.thymeleaf.org\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\"\n" +
                "          content=\"width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0\">\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n" +
                "    <title>Email</title>\n" +
                "<style>\n" +
                "body {background-color: powderblue;}\n" +
                "h2   {color: blue; font-family: verdana;}\n" +
                "h3   {color: Tomato; font-family: verdana;}\n" +
                "h4   {color: MediumSeaGreen; font-family: courier;}\n" +
                "div    {color: SlateBlue; font-family: courier;}\n" +
                "</style>\n" +
                "</head>\n" +
                "<body>\n" +
                "<h2 >Welcome <b>" + userDto.getName() + "</b></h2>\n"+
                "<h4> Your account has been created succesfully!</h4>\n" +
                "<div> Your username is <b>" + userDto.getUsername() + "</b></div>\n" +
                "<div> Your password is <b>" + userDto.getPassword() + "</b></div>\n" +
                "<h3> Check out our newest books <a href=\"http://localhost:8081/app/index\"> HERE</a></h3>\n" +
                "</body>\n" +
                "</html>\n";
        try {
            helper.setText(html, true);
            helper.setTo(userDto.getEmail());
            helper.setFrom("bookstore@utcn.com");
            helper.setSentDate(new Date());
            helper.setSubject(userDto.getName() + ", your Bookstore account has been created");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        //Send mail
        mailSender.send(mimeMessage);
    }

    public  void sendEditAccountEmailToUser(UserDto userDto){
        // Create a mail sender
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(this.emailCfg.getHost());
        mailSender.setPort(this.emailCfg.getPort());
        mailSender.setUsername(this.emailCfg.getUsername());
        mailSender.setPassword(this.emailCfg.getPassword());

        // Create an email instance
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");

        String html = "<!doctype html>\n" +
                "<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\"\n" +
                "      xmlns:th=\"http://www.thymeleaf.org\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\"\n" +
                "          content=\"width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0\">\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n" +
                "    <title>Email</title>\n" +
                "<style>\n" +
                "body {background-color: powderblue;}\n" +
                "h2   {color: blue; font-family: verdana;}\n" +
                "h3   {color: Tomato; font-family: verdana;}\n" +
                "h4   {color: MediumSeaGreen; font-family: courier;}\n" +
                "div    {color: SlateBlue; font-family: courier;}\n" +
                "</style>\n" +
                "</head>\n" +
                "<body>\n" +
                "<h2 >Hello <b>" + userDto.getName() + "</b></h2>\n"+
                "<h4> Your account has been edited succesfully!</h4>\n" +
                "<div> Your current credentials are:</div>\n" +
                "<div> name: <b>" + userDto.getName() + "</b></div>\n" +
                "<div> surname: <b>" + userDto.getSurname() + "</b></div>\n" +
                "<div> email: <b>" + userDto.getEmail() + "</b></div>\n" +
                "<div> username: <b>" + userDto.getUsername() + "</b></div>\n" +
                "<div> password: <b>" + userDto.getPassword() + "</b></div>\n" +
                "<div> phone number: <b>" + userDto.getPhoneNumber() + "</b></div>\n" +
                "<h3> Check out our newest books <a href=\"http://localhost:8081/app/index\"> HERE</a></h3>\n" +
                "</body>\n" +
                "</html>\n";
        try {
            helper.setText(html, true);
            helper.setTo(userDto.getEmail());
            helper.setFrom("bookstore@utcn.com");
            helper.setSentDate(new Date());
            helper.setSubject(userDto.getName() + ", you edited your Bookstore account");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        //Send mail
        mailSender.send(mimeMessage);
    }

    public  void sendUnusedBooksEmailToAdmin(List<SimpleBookDto> books){
        // Create a mail sender
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(this.emailCfg.getHost());
        mailSender.setPort(this.emailCfg.getPort());
        mailSender.setUsername(this.emailCfg.getUsername());
        mailSender.setPassword(this.emailCfg.getPassword());

        // Create an email instance
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");

        String html = "<!doctype html>\n" +
                "<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\"\n" +
                "      xmlns:th=\"http://www.thymeleaf.org\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\"\n" +
                "          content=\"width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0\">\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n" +
                "    <title>Email</title>\n" +
                "<style>\n" +
                "body {background-color: powderblue;}\n" +
                "h2   {color: blue; font-family: verdana;}\n" +
                "h3   {color: Tomato; font-family: verdana;}\n" +
                "h4   {color: MediumSeaGreen; font-family: courier;}\n" +
                "div    {color: SlateBlue; font-family: courier;}\n" +
                "</style>\n" +
                "</head>\n" +
                "<body>\n" +
                "<div> These following books were not bought at all:</div>\n" +
                "<div> <b>" +  books.toString() + "</b></div>\n" +
                "<h3>In order to delete/replace them login into your admin account <a href=\"http://localhost:8081/app/index\"> HERE</a></h3>\n" +
                "</body>\n" +
                "</html>\n";
        try {
            helper.setText(html, true);
            helper.setTo("adminBookstore@gmail.com");
            helper.setFrom("bookstore@utcn.com");
            helper.setSentDate(new Date());
            helper.setSubject("Some books are unused, you may want to delete them!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        //Send mail
        mailSender.send(mimeMessage);
    }
}
