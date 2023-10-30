package com.baqalati.users.controller;

import com.baqalati.users.model.UserProfile;
import com.baqalati.users.repository.UserProfileRepository;
import com.baqalati.users.util.exceptions.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user-profiles")
public class UserProfileController {
    private final UserProfileRepository userProfileRepository;

    @Autowired
    public UserProfileController(UserProfileRepository userProfileRepository) {
        this.userProfileRepository = userProfileRepository;
    }

    @GetMapping
    public List<UserProfile> getAllUserProfiles() {
        return userProfileRepository.findAll();
    }

    @GetMapping("/{id}")
    public UserProfile getUserProfileById(@PathVariable Long id) {
        return userProfileRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("User profile not found"));
    }

    @PostMapping
    public UserProfile createUserProfile(@RequestBody UserProfile userProfile) {
        return userProfileRepository.save(userProfile);
    }

    @PutMapping("/{id}")
    public UserProfile updateUserProfile(@PathVariable Long id, @RequestBody UserProfile updatedUserProfile) {
        UserProfile userProfile = userProfileRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("User profile not found"));

        userProfile.setFullName(updatedUserProfile.getFullName());
        userProfile.setDateOfBirth(updatedUserProfile.getDateOfBirth());
        userProfile.setPhoneNumber(updatedUserProfile.getPhoneNumber());

        return userProfileRepository.save(userProfile);
    }

    @DeleteMapping("/{id}")
    public void deleteUserProfile(@PathVariable Long id) {
        UserProfile userProfile = userProfileRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("User profile not found"));

        userProfileRepository.delete(userProfile);
    }
}
