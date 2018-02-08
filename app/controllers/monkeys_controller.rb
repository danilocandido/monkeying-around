class MonkeysController < ApplicationController
  before_action :set_monkey, only: [:show, :update, :destroy]

  # GET /monkeys
  def index
    @monkeys = Monkey.all
    render json: @monkeys
  end

  # GET /monkeys/1
  def show
    render json: @monkey
  end

  # POST /monkeys
  def create
    @monkey = Monkey.new(monkey_params)

    if @monkey.save
      render json: @monkey, status: :created, location: @monkey
    else
      render json: @monkey.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /monkeys/1
  def update
    if @monkey.update(monkey_params)
      render json: @monkey
    else
      render json: @monkey.errors, status: :unprocessable_entity
    end
  end

  # DELETE /monkeys/1
  def destroy
    @monkey.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monkey
      @monkey = Monkey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def monkey_params
      params.fetch(:monkey, {})
    end
end
