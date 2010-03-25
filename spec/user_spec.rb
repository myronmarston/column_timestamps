require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe User do
  it "should return the timestamped_column_names from #timestamped_column_names" do
    User.timestamped_column_names.should =~ %w( name role state )
  end

  it "should initially have nil values for the column timestamps" do
    @user = User.new
    @user.name_updated_at.should be_nil
    @user.state_updated_at.should be_nil
    @user.role_updated_at.should be_nil
  end

  it "should not set the the column timestamps when saved without name or state values" do
    @user = User.create!; @user.reload
    @user.name_updated_at.should be_nil
    @user.state_updated_at.should be_nil
  end

  it "should set a timestamp on creation for columns that have a default" do
    @now = Time.now
    Time.stub!(:now).and_return(@now)
    @user = User.create!
    @user.reload
    @user.role_updated_at.to_s.should == @now.to_s
  end

  describe "saving the record with a name value" do
    before(:each) do
      @now = @now1 = Time.now
      Time.stub!(:now).and_return { @now }
      @user = User.create!(:name => 'David')
      @user.reload
    end

    it "should set the name_updated_at timestamp" do
      @user.name_updated_at.to_s.should == @now1.to_s
    end

    it "should not set the state_updated_at timestamp" do
      @user.state_updated_at.should be_nil
    end

    describe "and later updating the state value" do
      before(:each) do
        @now = @now2 = (@now1 + 1.day)
        @user.state = 'approved'
        @user.save!
        @user.reload
      end

      it "should set the state_updated_at timestamp" do
        @user.state_updated_at.to_s.should == @now2.to_s
      end

      it "should not update the name_updated_at timestamp" do
        @user.name_updated_at.to_s.should == @now1.to_s
      end

      describe "and later updating another attribute" do
        before(:each) do
          @now = @now3 = (@now2 + 1.day)
          @user.email_address = 'dave@example.com'
          @user.save!
          @user.reload
        end

        it "should not update the state_updated_at timestamp" do
          @user.state_updated_at.to_s.should == @now2.to_s
        end

        it "should not update the name_updated_at timestamp" do
          @user.name_updated_at.to_s.should == @now1.to_s
        end
      end

      describe "and later updating the name attribute" do
        before(:each) do
          @now = @now3 = (@now2 + 1.day)
          @user.name = 'Dave'
          @user.save!
          @user.reload
        end

        it "should not update the state_updated_at timestamp" do
          @user.state_updated_at.to_s.should == @now2.to_s
        end

        it "should update the name_updated_at timestamp" do
          @user.name_updated_at.to_s.should == @now3.to_s
        end
      end
    end
  end
end