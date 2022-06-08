package com.expense.controllers;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.expense.models.Expense;
import com.expense.services.ExpenseService;

@Controller
@RequestMapping("/expenses")
public class ExpenseController {
	
	@Autowired
	ExpenseService expenseService;
	
	@RequestMapping("")
	public String index(
			@ModelAttribute("expense") Expense expense, 
			Model model
			) {
		ArrayList<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	
	@PostMapping("/add")
	public String processCreateForm(
			@Valid @ModelAttribute("expense") Expense expense, 
			BindingResult result, 
			Model model
			) {
		if (result.hasErrors()) {
			ArrayList<Expense> expenses = expenseService.allExpenses();
			model.addAttribute("expenses", expenses);
			return "index.jsp";
		} else {
			expenseService.createExpense(expense);
			return "redirect:/expenses";
		}
	}
	
	@RequestMapping("/view/{id}")
	public String showExpense(
			@PathVariable("id") Long id, 
			Model model
			) {
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		return "showExpense.jsp";
	}
	
	@RequestMapping("/{id}")
	public String editExpense(
			@PathVariable("id") Long id, 
			Model model
			) {
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		return "editExpense.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String processEditForm(
			@PathVariable("id") Long id, 
			@Valid @ModelAttribute("expense") Expense expense, 
			BindingResult result, 
			Model model
			) {
		if (result.hasErrors()) {
			return "editExpense.jsp";
		} else {
			expenseService.updateExpense(expense);
			return "redirect:/expenses";
		}
	}
	
	@DeleteMapping("delete/{id}")
	public String deleteExpense(@PathVariable("id") Long id) {
		expenseService.destroyExpense(id);
		return "redirect:/expenses";
	}
	
	
	
}
