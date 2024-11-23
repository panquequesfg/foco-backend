class TranscriptsController < ApplicationController # Should be websocket
  before_action :set_transcript, only: %i[ show update destroy ]

  # GET /transcripts
  def index
    @transcripts = Transcript.all

    render json: @transcripts
  end

  # GET /transcripts/1
  def show
    render json: @transcript
  end

  # POST /transcripts
  def create
    @transcript = Transcript.new(transcript_params)

    if @transcript.save
      render json: @transcript, status: :created, location: @transcript
    else
      render json: @transcript.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transcripts/1
  def update
    if @transcript.update(transcript_params)
      render json: @transcript
    else
      render json: @transcript.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transcripts/1
  def destroy
    @transcript.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transcript
      @transcript = Transcript.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transcript_params
      params.require(:transcript).permit(:content, :session_id)
    end
end
