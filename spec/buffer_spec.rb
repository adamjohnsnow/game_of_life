# require 'buffer'
#
# describe Buffer do
#
#   it 'buffers a 3x3 grid with a layer of zeros' do
#     buffer = Buffer.add_buffer([
#       [1, 0, 0],
#       [0, 0, 0],
#       [0, 0, 0]
#       ])
#     expect(buffer).to eq [
#       [0, 0, 0, 0, 0],
#       [0, 1, 0, 0, 0],
#       [0, 0, 0, 0, 0],
#       [0, 0, 0, 0, 0],
#       [0, 0, 0, 0, 0]
#     ]
#   end
#
#   it 'buffers a 5x4 grid with a layer of zeros' do
#     buffer = Buffer.add_buffer([
#       [0, 0, 1, 0, 0],
#       [1, 1, 0, 0, 0],
#       [0, 0, 0, 0, 0],
#       [0, 1, 0, 1, 0]
#       ])
#     expect(buffer).to eq [
#       [0, 0, 0, 0, 0, 0, 0],
#       [0, 0, 0, 1, 0, 0, 0],
#       [0, 1, 1, 0, 0, 0, 0],
#       [0, 0, 0, 0, 0, 0, 0],
#       [0, 0, 1, 0, 1, 0, 0],
#       [0, 0, 0, 0, 0, 0, 0]
#     ]
#   end
# end
