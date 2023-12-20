package com.spring.farm.util;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component
public class MailHandler {
	SimpleMailMessage message;	
	
	MailSender mailSender;
	
	
	public MailHandler(MailSender mailSender) throws MessagingException{
		message = new SimpleMailMessage();
		this.mailSender=mailSender;
	}
	
	public void setSubject(String subject) throws MessagingException{
		message.setSubject(subject);
	}
	
	public void setText(String content) throws MessagingException {
		message.setText(content);
	}
	
	public void setFrom(String from) throws MessagingException {
		message.setFrom(from);
	}
	
	public void setTo(String to) throws MessagingException {
		message.setTo(to);
	}
	
	public SimpleMailMessage getMailHandler() {
		return message;
	}
	
	public void send() {
		System.out.println("메일세팅값 확인: " +message);
		mailSender.send(message);
	}
	

}
