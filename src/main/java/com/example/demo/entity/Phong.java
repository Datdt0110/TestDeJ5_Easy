package com.example.demo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "phong")

public class Phong {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "id_loai_phong")
    private LoaiPhong loaiPhong;
    @Column(name = "ten_phong")
    @NotBlank(message = "Không được để trống tên phòng")
    private String tenPhong;

    @Column(name = "so_luong_phong")
    @NotBlank(message = "Không được để trống số lượng")
    private String soLuong;
    @Column(name = "trang_thai")
    private String trangThai;

    @Column(name = "ghi_chu")
    @NotBlank(message = "Không được để trống ghi chú")
    private String ghiChu;


}
