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
@Table(name = "dich_vu")
public class DichVu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;
    @ManyToOne
    @JoinColumn(name =  "id_loai_dich_vu")
    private LoaiDichVu loaiDichVu;
    @Column(name = "ten_dich_vu")
    private String tenDichVu;
    @Column(name="don_gia")
    private Double donGia;
    @Column(name="don_vi_tien")

    private String donViTien;
    @Column(name="mo_ta")
    private String moTa;
    @Column(name="trang_thai")
    private  String trangThai;

}

