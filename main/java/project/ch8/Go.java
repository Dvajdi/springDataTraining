package project.ch8;

import org.springframework.context.support.GenericXmlApplicationContext;
import project.ch8.models.Contact;
import project.ch8.models.ContactAudit;
import project.ch8.services.ContactAuditService;
import project.ch8.services.ContactService;

import java.util.Date;
import java.util.List;


public class Go {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
    ctx.load("classpath:META-INF/spring/spring-app-conf.xml");
    ctx.refresh();

    ContactService contactService = (ContactService) ctx.getBean("springJpaContactService");
    /*listContacts("findAll:",contactService.findAll());
    listContacts("findByFirstName",contactService.findByFirstName("Piska"));
    listContacts("fff",contactService.findByLastName("Matashnyuk"));*/

    ContactAuditService contactAuditService = (ContactAuditService) ctx.getBean("contactAuditService");
    List<ContactAudit> contacts = contactAuditService.findAll();
    listContacts("first",contacts);

    ContactAudit contactAudit = new ContactAudit();
    contactAudit.setFirstName("Pavel");
    contactAudit.setLastName("Matashnyuk");
    contactAudit.setBirthDate(new Date());
    contactAuditService.save(contactAudit);

    contacts = contactAuditService.findAll();
    listContacts("first",contacts);
  }

  private static void listContacts(String s, List<ContactAudit> all) {
    System.out.println(s);
    for (int i = 0; i <all.size() ; i++) {
      System.out.println(all.get(i));
    }
  }
}
