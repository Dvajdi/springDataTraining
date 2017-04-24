package project.ch8.services;

import project.ch8.models.Contact;

import java.util.List;

/**
 * Created by Dvajdi on 24.04.2017.
 */
public interface ContactService {
  List<Contact> findAll();
  List<Contact> findByFirstName(String firstName);
  List<Contact> findByFirstNameAndLastName(String firstname,String lastName);
  List<Contact> findByLastName(String lastName);
}
