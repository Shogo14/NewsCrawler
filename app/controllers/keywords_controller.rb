class KeywordsController < ApplicationController
    before_action :correct_user,   only: :destroy
    def create
        @keyword = current_user.keywords.build(keyword_params)
        if current_user.save
            flash[:success] = "キーワード登録が完了!"
            redirect_to current_user
        else
            flash[:danger] = '登録文字が20文字を越えています'
            # redirect_to current_user
            redirect_to current_user
        end
    end

    def destroy
        @keyword.destroy
        flash[:success] = "削除しました"
        redirect_to request.referrer || root_url
    end

        private

        def keyword_params
            params.require(:keyword).permit(:keywords_contents)
        end
        
        def correct_user
            @keyword = current_user.keywords.find_by(id: params[:id])
            redirect_to root_url if @keyword.nil?
        end
end
