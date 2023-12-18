require 'spec_helper'
require_relative '../executor'

describe 'Executor' do
  context 'when initialized' do
    let(:executor) { Executor.new }

    it 'should have an empty instruction' do
      expect(executor.instruction).to eq('')
    end

    it 'should initialize a toy_board instance' do
      expect(executor.toy_board).to be_a(Board)
    end
  end

  context 'when executing' do
    let(:executor) { Executor.new }

    context 'when a PLACE instruction had been given' do
      before do
        executor.execute('PLACE 1,1,NORTH')
      end

      context 'should have placed the robot on the board' do
        it 'with matching direction' do
          expect(executor.robot.direction).to eq(:north)
        end

        it 'with matching x coordinate' do
          expect(executor.toy_board.x).to eq(1)
        end

        it 'with matching y coordinate' do
          expect(executor.toy_board.y).to eq(1)
        end
      end
      
      context 'when a LEFT instruction has been given' do
        before do
          executor.execute('LEFT')
        end

        it 'should have turned the robot left' do
          expect(executor.robot.direction).to eq(:west)
        end
      end

      context 'when a RIGHT instruction has been given' do
        before do
          executor.execute('RIGHT')
        end

        it 'should have turned the robot right' do
          expect(executor.robot.direction).to eq(:east)
        end
      end

      context 'when a MOVE instruction has been given' do
        before do
          executor.execute('MOVE')
        end

        it 'should have moved the robot' do
          expect(executor.toy_board.y).to eq(2)
        end

        it 'should preserve robot direction' do
          expect(executor.robot.direction).to eq(:north)
        end

        it 'should preserve unchanged robot coordinate' do
          expect(executor.toy_board.x).to eq(1)
        end
      end

      context 'when a REPORT instruction has been given' do
        it 'should have reported the robot position' do
          expect(executor.execute('REPORT')).to eq('1,1,NORTH')
        end
      end

      context 'when a new PLACE instruction has been given' do
        before do
          executor.execute('PLACE 2,2,SOUTH')
        end

        it 'should have placed the robot on the board' do
          expect(executor.robot.direction).to eq(:south)
          expect(executor.toy_board.x).to eq(2)
          expect(executor.toy_board.y).to eq(2)
        end
      end

      context 'when a new PLACE instruction has been given with invalid coordinates' do
        before do
          executor.execute('PLACE 5,5,SOUTH')
        end

        it 'should not have changed the location of the robot' do
          expect(executor.execute('REPORT')).to eq('1,1,NORTH')
        end
      end

      context 'when a new PLACE instruction has been given with invalid direction' do
        before do
          executor.execute('PLACE 1,1,DOWN')
        end

        it 'should not have changed the direction of the robot' do
          expect(executor.execute('REPORT')).to eq('1,1,NORTH')
        end
      end

      context 'when an EXIT instruction has been given' do
        it 'should have exited the program' do
          expect(executor.execute('EXIT')).to eq('')
        end
      end
    end

    context 'when no PLACE instruction had been given' do
      context 'when a LEFT instruction has been given' do
        it 'should not have turned the robot left' do
          executor.execute('LEFT')
          expect(executor.robot).to be_nil
        end
      end

      context 'when a RIGHT instruction has been given' do
        it 'should not have turned the robot right' do
          executor.execute('RIGHT')
          expect(executor.robot).to be_nil
        end
      end

      context 'when a MOVE instruction has been given' do
        it 'should not have moved the robot' do
          executor.execute('MOVE')
          expect(executor.robot).to be_nil
        end
      end

      context 'when a REPORT instruction has been given' do
        it 'should not have reported the robot position' do
          expect(executor.execute('REPORT')).to eq('')
        end
      end
    end

    context 'when an invalid instruction has been given' do
      it 'should have reported an error' do
        expect(executor.execute('JUMP')).to eq('Invalid instruction')
      end
    end
  end
end
