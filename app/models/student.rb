
class Student

        attr_accessor :first_name


        @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test (boating_test_name,boating_test_status, instructor)
        BoatingTest.new(self, boating_test_name,boating_test_status, instructor)

    end

    def self.find_student(student_first_name)
        self.all.find {|student| student.first_name == student_first_name}
        
    end
   
    def grade_percentage
       student_test = BoatingTest.all.select{|test|test.student == self}
       passing_test = student_test.select{|test|test.status == "passed"} 
       total_num_test = student_test.size
       total_passed_tests = passing_test.size

       percent = (total_num_test/total_passed_tests) * 100
    end

    
end



