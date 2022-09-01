class StudentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid_response

def index
    render json: Student.all
end

def create
    student = Student.create!(student_params)
    render json: student, status: :created
end

def update
    student = find_student
    student.update(student_params)
    render json :student
end

def destroy
    student = find_student
    student.destroy
end

def show
    student = find_student
    render json: student
end

private
    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student
        Student.find(params[:id])
    end

    def render_not_found_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :not_found
    end

    def render_record_invalid_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
