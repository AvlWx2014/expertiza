module SubmissionViewingEventHelper

  # Returns number of seconds the review given at response_map_id took during given round
  def getTotalTime(response_map_id, round)

    # Finds submission_viewing_event rows corresponding to map and round given
    timeLog = SubmissionViewingEvent.where(map_id: response_map_id, round: round)
    totalSeconds = 0; # Storage for number of seconds

    # Subtracts start_time from end_time for each link and adds to total number of seconds
    timeLog.each do |linkTime|
      totalSeconds = totalSeconds + (linkTime.end_at - linkTime.start_at).to_i
    end

    return totalSeconds

  end

  # Returns time in readable text (i.e. 1 hr 2 min 3 sec) given number of seconds
  def secondsToHuman(timeInSec)
    
    hours = timeInSec/3600
    timeInSec = timeInSec%3600

    mins = timeInSec/60
    timeInSec = timeInSec%60

    return hours.to_s + " hours " + mins.to_s + " min " + timeInSec + " sec"
  end
end
