package project.ch8;

import org.springframework.context.support.GenericXmlApplicationContext;
import project.ch8.models.ContactAudit;
import project.ch8.services.ContactAuditService;

import java.util.Date;

/**
 * Created by Dvajdi on 25.04.2017.
 */
public class GoWithAudit {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
    ctx.load("classpath:META-INF/spring/spring-app-conf.xml");
    ctx.refresh();

    ContactAuditService contactAuditService
        = ctx.getBean("contactAuditService",ContactAuditService.class);

    ContactAudit contactAudit = new ContactAudit();
    contactAudit.setFirstName("Pavel12");
    contactAudit.setLastName("Matashnyuk9");
    contactAudit.setBirthDate(new Date());

    contactAuditService.save(contactAudit);

    contactAudit.setFirstName("IVAN");
    contactAudit.setLastName("petrovich");
    contactAuditService.save(contactAudit);

    ContactAudit oldContact = contactAuditService.findAuditByRevision(1l,1);
    System.out.println(oldContact);

    oldContact = contactAuditService.findAuditByRevision(1l,2);
    System.out.println(oldContact);
  }
}
