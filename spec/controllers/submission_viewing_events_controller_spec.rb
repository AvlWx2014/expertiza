describe SubmissionViewingEventsController do

  describe '#action_allowed?' do
    it "should return true" do
      expect(controller.send(:action_allowed?)).to be true
    end
  end

  describe '#record_start_time' do
    context 'when the link is opened and timed' do
      it 'should update time record with end time as current time' do

      end

      it 'should update time record with end time as current time for an Expertiza Review link' do

      end
    end
  end

  describe '#record_end_time' do
    context 'when response does not have a end time' do
      it 'should update time record with end time as current time' do

      end
    end
  end

  describe '#mark_end_time' do
    context 'end time for all uncommitted files' do
      it 'update end time for all the files that are not having an end time' do

      end
    end
  end

end