package project.ch8;

import org.springframework.data.domain.AuditorAware;

public class AuditorAwareBean implements AuditorAware<String> {
  public String getCurrentAuditor() {
    return "Pupsik";
  }
}
