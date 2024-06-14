package com.example.demo.repository.ktra;

import com.example.demo.entity.DichVu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DichVuRepository  extends JpaRepository<DichVu,Integer> {

}
