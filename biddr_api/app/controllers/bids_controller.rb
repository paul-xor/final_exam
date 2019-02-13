class BidsController < ApplicationController
    before_action :find_bid, only: [:destroy]
    
    
    def create
        @auction = Auction.find params[:auction_id]
        @bid = Bid.new bid_params
        @bid.auction = @auction
        
        if @bid.save
          redirect_to auction_path(@auction.id)
        else
          @bids = @auction.bids.order(created_at: :desc)
          render "auctions/show"
        end
    end

    def destroy
    end

    private
    def bid_params
        params.require(:bid).permit(:bid_price)
    end

    def find_bid
        @bid = Answer.bid(params[:id])
    end
end