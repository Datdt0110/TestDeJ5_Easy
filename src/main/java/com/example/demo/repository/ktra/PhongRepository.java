package com.example.demo.repository.ktra;

import com.example.demo.entity.Phong;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhongRepository extends JpaRepository<Phong,Integer> {
}
