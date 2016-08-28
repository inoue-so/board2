class MessagesController < ApplicationController
  def create
  	@message = current_user.messages.build(message_params)
  	@board = Board.find(params[:board_id])
    @message.board = @board
    respond_to do |format|
      if @message.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content,:picture)
    end
end
