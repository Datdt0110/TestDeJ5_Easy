package com.example.demo.controller;

import com.example.demo.entity.DichVu;
import com.example.demo.repository.ktra.DichVuRepository;
import com.example.demo.repository.ktra.LoaiDichVuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("dich-vu")
public class DichVuController {
    @Autowired
    private DichVuRepository dichVuRepository;
    @Autowired
    private LoaiDichVuRepository loaiDichVuRepository;

    @GetMapping("hien-thi")
    public String index(Model model) {
        model.addAttribute("listDV", this.dichVuRepository.findAll());
        model.addAttribute("listLDV", this.loaiDichVuRepository.findAll());
        return "dich_vu/index";

    }

    @PostMapping("add")
    public String add(@ModelAttribute DichVu dichVu) {
        this.dichVuRepository.save(dichVu);
        return "redirect:/dich-vu/hien-thi";
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        DichVu dichVu = dichVuRepository.findById(id).orElse(null);
        model.addAttribute("dichVu", dichVu);
        model.addAttribute("listDV", this.dichVuRepository.findAll());
        model.addAttribute("listLDV", this.loaiDichVuRepository.findAll());
        return "dich_vu/index";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable Integer id){
        dichVuRepository.deleteById(id);
        return "redirect:/dich-vu/hien-thi";
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable Integer id, @ModelAttribute DichVu dichVu) {
        dichVu.setId(id); // Đảm bảo đối tượng có ID chính xác để cập nhật
        dichVuRepository.save(dichVu);
        return "redirect:/dich-vu/hien-thi";
    }



}
