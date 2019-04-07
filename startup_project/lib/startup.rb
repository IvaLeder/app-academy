require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    salaries.has_key?(title)
  end

  def size
    employees.size
  end

  def hire(employee_name, title)
    if self.valid_title?(title)
      new_hire = Employee.new(employee_name, title)
      employees.push(new_hire)
    else
      raise error('Not a valid title!')
    end
  end

  def >(startup)
    @funding > startup.funding
  end

  def pay_employee(employee)
    pay = @salaries[employee.title]
    if @funding >= pay
      employee.pay(pay)
      @funding -= pay
    else
      raise error('No money! :(')
    end
  end

  def payday
    employees.each { |employee| pay_employee(employee) }
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    @salaries = startup.salaries.merge(@salaries)
    @employees.push(*startup.employees)
    startup.close
  end

  def average_salary
    total = 0.0
    employees.each do |emp|
      total += @salaries[emp.title]
    end
    total / employees.length
  end
end
