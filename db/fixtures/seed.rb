Branch.seed(:id,
  { id: 1, name: 'Chennai', address_1: 'No 38, Muthupalaniyappan Nagar,', address_2: 'Samy Street,Nagalkeni,Chrompet', city: 'Chennai', pin_code: 600044, mobile: 9840085238 },
  { id: 2, name: 'Coimpatore', address_1: 'No 38, Muthupalaniyappan Nagar,', address_2: 'Samy Street,Nagalkeni,Chrompet', city: 'Coimbatore', pin_code: 600044, mobile: 9840085238 },
  { id: 3, name: 'Bangalore', address_1: 'No 38, Muthupalaniyappan Nagar,', address_2: 'Samy Street,Nagalkeni,Chrompet', city: 'Bangalore', pin_code: 600044, mobile: 9840085238 }
)

Role.seed(:id,
  { id: 1, name: 'Admin' },
  { id: 2, name: 'Production' },
  { id: 3, name: 'Sales' }
)

Department.seed(:id,
  { id: 1, name: 'Admin' },
  { id: 2, name: 'Purchase' },
  { id: 3, name: 'Production' },
  { id: 4, name: 'Winding' },
  { id: 5, name: 'Testing' },
  { id: 6, name: 'Sales' },
  { id: 7, name: 'Service' },
  { id: 8, name: 'Accounts' }
)

User.seed(:id,
  { id: 1, name: 'Bala', username: 'admin', mobile: '9940058974', password: "password", role_id: Role.first.id, branch_id: Branch.first.id, email: 'manjunath@vertexpower.co.in', department_id: Department.first.id, aadhar_no: '123456789011', pan_no: '1234567890' }
)

Tax.seed(:id,
  { id: 1, name:'CGST-2.5', percentage: 2.5, tax_type: 1 },
  { id: 2, name:'CGST-6', percentage: 6, tax_type: 1 },
  { id: 3, name:'CGST-9', percentage: 9, tax_type: 1 },
  { id: 4, name:'CGST-14', percentage: 14, tax_type: 1 },
  { id: 5, name:'CGST-0', percentage: 0, tax_type: 1 },
  { id: 6, name:'SGST-2.5', percentage: 2.5, tax_type: 2 },
  { id: 7, name:'SGST-6', percentage: 6, tax_type: 2 },
  { id: 8, name:'SGST-9', percentage: 9, tax_type: 2 },
  { id: 9, name:'SGST-14', percentage: 14, tax_type: 2 },
  { id: 10, name:'SGST-0', percentage: 0, tax_type: 2 },
  { id: 11, name:'IGST-5', percentage: 5, tax_type: 3 },
  { id: 12, name:'IGST-12', percentage: 12, tax_type: 3 },
  { id: 13, name:'IGST-18', percentage: 18, tax_type: 3 },
  { id: 14, name:'IGST-24', percentage: 24, tax_type: 3 },
  { id: 15, name:'IGST-0', percentage: 0, tax_type: 3 }
)
