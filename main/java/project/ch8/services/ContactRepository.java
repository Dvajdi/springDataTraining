package project.ch8.services;

import org.springframework.data.repository.CrudRepository;
import project.ch8.models.Contact;

import java.util.List;

/**
 * Created by Dvajdi on 24.04.2017.
 */
public interface ContactRepository extends CrudRepository<Contact,Long> {
  List<Contact> findByFirstName(String firstName);
  List<Contact> findByFirstNameAndLastName(String firstName,String lastName);
  List<Contact> getFirstByLastName(String lastName);
}
