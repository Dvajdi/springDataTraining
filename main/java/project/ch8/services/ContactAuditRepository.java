package project.ch8.services;

import org.springframework.data.repository.CrudRepository;
import project.ch8.models.ContactAudit;

/**
 * Created by Dvajdi on 24.04.2017.
 */
public interface ContactAuditRepository extends CrudRepository<ContactAudit,Long> {
}
