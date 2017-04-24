package project.ch8.services;


import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.ch8.models.ContactAudit;

import java.util.List;

@Service("contactAuditService")
@Transactional
@Repository
public class ContactAuditServiceImpl implements ContactAuditService{
  @Autowired
  private ContactAuditRepository contactAuditRepository;

  @Transactional(readOnly = true)
  public List<ContactAudit> findAll() {
    return Lists.newArrayList(contactAuditRepository.findAll());
  }
  @Transactional(readOnly = true)
  public ContactAudit findById(Long id) {
    return contactAuditRepository.findOne(id);
  }

  public ContactAudit save(ContactAudit contactAudit) {
    return contactAuditRepository.save(contactAudit);
  }
}
