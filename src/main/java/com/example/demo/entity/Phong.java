package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="phong")

public class Phong {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "id_loai_phong")
    private LoaiPhong loaiPhong;
    @Column(name = "ghi_chu")
    private String ghiChu;
    @Column(name = "so_luong_phong")
    private String soLuong;
    @Column(name = "ten_phong")
    private String tenPhong;
    @Column(name = "trang_thai")
    private String trangThai;
}
