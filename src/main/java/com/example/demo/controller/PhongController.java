package com.example.demo.controller;

import com.example.demo.entity.LoaiPhong;
import com.example.demo.entity.Phong;
import com.example.demo.repository.ktra.LoaiPhongRepository;
import com.example.demo.repository.ktra.PhongRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("phong")
public class PhongController {


    @Autowired
    private PhongRepository phongRepository;
    @Autowired
    private LoaiPhongRepository loaiPhongRepository;

    @GetMapping("hien-thi")
    public String index(Model model) {
        model.addAttribute("listP", this.phongRepository.findAll());
        model.addAttribute("listLP", this.loaiPhongRepository.findAll());
        return "phong/index";
    }

    @PostMapping("add")
    public String addPhong(@Valid @ModelAttribute Phong phong, BindingResult validateResult, Model model) {
        if (validateResult.hasErrors()) {
            List<FieldError> errorList = validateResult.getFieldErrors();
            Map<String, String> errors = new HashMap<>();
            for (FieldError fe : errorList) {
                errors.put(fe.getField(), fe.getDefaultMessage());
            }
            model.addAttribute("errors", errors);
            model.addAttribute("phong", phong);
            model.addAttribute("listP", this.phongRepository.findAll());
            model.addAttribute("listLP", this.loaiPhongRepository.findAll());
            return "phong/index";
        }
        this.phongRepository.save(phong);
        return "redirect:/phong/hien-thi";
    }

    @GetMapping("detail/{id}")
    public String detailPhong( @PathVariable Integer id, Model model){
        Phong phong = phongRepository.findById(id).orElse(null);
        model.addAttribute("phong", phong);
        model.addAttribute("listP", this.phongRepository.findAll());
        model.addAttribute("listLP", this.loaiPhongRepository.findAll());
        return "phong/index";
    }

    @GetMapping("paging")
    public String phanTrang(@RequestParam(defaultValue = "0") Integer page , Model model){
        Page<Phong> phongPage = phongRepository.findAll(PageRequest.of(page,5));
        model.addAttribute("listP", phongPage.getContent());
        model.addAttribute("listLP", this.loaiPhongRepository.findAll());
        return "phong/index";
    }
}
