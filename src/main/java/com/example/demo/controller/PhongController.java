package com.example.demo.controller;

import com.example.demo.entity.LoaiPhong;
import com.example.demo.entity.Phong;
import com.example.demo.repository.ktra.LoaiPhongRepository;
import com.example.demo.repository.ktra.PhongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("phong")
public class PhongController {
    @Autowired
    private PhongRepository phongRepository;
    @Autowired
    private LoaiPhongRepository loaiPhongRepository;

    @GetMapping("hien-thi")
    public String index(Model model){
        model.addAttribute("listP",this.phongRepository.findAll());
        model.addAttribute("listLP",this.loaiPhongRepository.findAll());
        return "phong/index";
    }

    @PostMapping("add")
    public String addPhong(@RequestParam("tenPhong") String tenPhong,
                           @RequestParam("soLuong") String soLuong,
                           @RequestParam("trangThai") String trangThai,
                           @RequestParam("ghiChu") String ghiChu,
                           @RequestParam("loaiPhong") Integer loaiPhongId) {
        LoaiPhong loaiPhong = loaiPhongRepository.findById(loaiPhongId).orElse(null);
        if (loaiPhong != null) {
            Phong phong = new Phong();
            phong.setTenPhong(tenPhong);
            phong.setSoLuong(soLuong);
            phong.setTrangThai(trangThai);
            phong.setGhiChu(ghiChu);
            phong.setLoaiPhong(loaiPhong);
            phongRepository.save(phong);
        }
        return "redirect:/phong/hien-thi";
    }

    @GetMapping("detail/{id}")
    public String detailPhong(@PathVariable Integer id, Model model){
        Phong phong = phongRepository.findById(id).orElse(null);
        model.addAttribute("phong", phong);
        model.addAttribute("listP",this.phongRepository.findAll());
        model.addAttribute("listLP",this.loaiPhongRepository.findAll());
        return "phong/index";
    }

    @GetMapping("paging")
    public String paging(@RequestParam(defaultValue = "0") int page, Model model) {
        Page<Phong> phongPage = phongRepository.findAll(PageRequest.of(page, 5));
        model.addAttribute("listP", phongPage.getContent());
        model.addAttribute("listLP", this.loaiPhongRepository.findAll());
        return "phong/index";
    }
}
