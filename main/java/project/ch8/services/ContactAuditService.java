package project.ch8.services;

import project.ch8.models.ContactAudit;

import java.util.List;

/**
 * Created by Dvajdi on 24.04.2017.
 */
public interface ContactAuditService {
  List<ContactAudit> findAll();
  ContactAudit findById(Long id);
  ContactAudit save(ContactAudit contactAudit);
}
