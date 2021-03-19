describe SubmissionViewingEventsController do

  describe '#action_allowed?' do
    it "should return true" do
      expect(controller.send(:action_allowed?)).to be true
    end
  end

  describe '#record_start_time' do
    context 'when the link is opened and timed' do
      it 'should update/create a record without any error' do
        params = {:format => 'json',:submission_viewing_event => {:map_id => 1,:round => 1, :link => 'Expertiza Review'}}
        post :record_start_time,params
        expect(response.status).to eq(200)
      end
    end
  end


  describe '#record_end_time' do
    context 'when response does not have a end time' do
      it 'should update time record with end time as current time' do
        params = {:format => 'json',:submission_viewing_event => {:map_id => 1,:round => 1, :link => 'Expertiza Review'}}
        post :record_end_time,params
        expect(response.status).to eq(204)
      end
    end
  end


  describe '#mark_end_time' do
    context 'end time for all uncommitted files' do
      it 'update end time for all the files that are not having an end time' do
        params = {:format => 'json',:submission_viewing_event => {:map_id => 1,:round => 1, :link => 'Expertiza Review'}}
        post :mark_end_time,params
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#getTimingDetails' do
    context 'get timing details for specific peer review' do

      before(:each)do
        @submission_viewing_event = SubmissionViewingEvent.new();
      end

      it 'returns a json the contains all information that is needed' do

        params = {:format => 'json',:reponse_map_id => @submission_viewing_event.map_id,:round => @submission_viewing_event.round}
        post :getTimingDetails,params

        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to have_key("Labels")
        expect(JSON.parse(response.body)).to have_key("Data")
        expect(JSON.parse(response.body)).to have_key("tables")
        expect(JSON.parse(response.body)).to have_key("total")
        expect(JSON.parse(response.body)).to have_key("totalavg")
      end
    end
  end

  describe '#submission_viewing_event_params' do
    context 'receiving params from request' do
      it 'should filter the params correctly' do
        should permit(:map_id, :round, :link, :start_at, :end_at).
            for(:record_start_time, verb: :post, params:{submission_viewing_event: {map_id: 123, round: 2, link: "google.com", start_at: 0, end_at: 0}})
      end
    end
  end

end