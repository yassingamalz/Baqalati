package com.baqalati.users.repository;

import com.baqalati.users.model.UserProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserProfileRepository extends JpaRepository<UserProfile, Long> {
    // Custom query methods or additional operations can be defined here
}
