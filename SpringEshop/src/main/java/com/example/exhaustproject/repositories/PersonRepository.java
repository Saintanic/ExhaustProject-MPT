package com.example.exhaustproject.repositories;

import com.example.exhaustproject.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PersonRepository extends JpaRepository<Person, Integer> {
    // Получаем запись из БД по логину
    Optional<Person> findByLogin(String login);

}
