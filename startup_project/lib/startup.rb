require "employee"

require 'byebug'

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = {}
        salaries.each do |title, salary|
            @salaries[title] = salary
        end
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        if !self.valid_title?(title)
            raise "#{@name} isn't hiring any #{title}s"
        else
            @employees << Employee.new(employee_name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        payment = @salaries[employee.title]

        if @funding >= payment
            employee.pay(payment)
            @funding -= payment
        else
            raise 'Not enough money'
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end

    def average_salary
        total_salaries = 0
        @employees.each do |employee|
            total_salaries += @salaries[employee.title]
        end
        total_salaries / @employees.count
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        # Add funding
        @funding += startup.funding
        
        # Merge salaries
        startup.salaries.each do |title, salary|
            @salaries[title] = salary if !@salaries.has_key?(title)
        end

        # Hire employees
        @employees += startup.employees

        # Close acquired startup
        startup.close
    end
end
