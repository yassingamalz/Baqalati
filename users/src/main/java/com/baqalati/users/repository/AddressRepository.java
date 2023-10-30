package com.baqalati.users.repository;

import com.baqalati.users.model.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {
    // Custom query methods or additional operations can be defined here
}
