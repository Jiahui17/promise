module __simple_loop__simple_loop_0_next(
  input wire clk,
  input wire rst,
  input wire [9:0] simple_loop__chan_n,
  input wire simple_loop__chan_n_vld,
  input wire simple_loop__chan_result_rdy,
  output wire [9:0] simple_loop__chan_result,
  output wire simple_loop__chan_result_vld,
  output wire simple_loop__chan_n_rdy
);
  reg [9:0] ____state_1 = 0;
  reg ____state_0 = 0;
  reg [9:0] __simple_loop__chan_n_reg = 0;
  reg __simple_loop__chan_n_valid_reg = 0;
  reg [9:0] __simple_loop__chan_result_reg = 0;
  reg __simple_loop__chan_result_valid_reg = 0;
  wire ugt_143;
  wire or_178;
  wire and_146;
  wire simple_loop__chan_result_valid_inv;
  wire and_147;
  wire __simple_loop__chan_result_vld_buf;
  wire simple_loop__chan_result_valid_load_en;
  wire [2:0] ____state_1__next_value_predicates;
  wire simple_loop__chan_result_not_pred;
  wire simple_loop__chan_result_load_en;
  wire [3:0] one_hot_149;
  wire p0_stage_done;
  wire simple_loop__chan_n_valid_inv;
  wire ____state_1__at_most_one_next_value;
  wire [2:0] concat_191;
  wire [9:0] add_167;
  wire [9:0] simple_loop__chan_n_select;
  wire simple_loop__chan_n_valid_load_en;
  wire nand_164;
  wire [9:0] one_hot_sel_192;
  wire and_200;
  wire simple_loop__chan_n_load_en;
  assign ugt_143 = ____state_1 > 10'h3b5;
  assign or_178 = ____state_0 | __simple_loop__chan_n_valid_reg;
  assign and_146 = ____state_0 & ugt_143;
  assign simple_loop__chan_result_valid_inv = ~__simple_loop__chan_result_valid_reg;
  assign and_147 = ____state_0 & ____state_1 < 10'h3b6;
  assign __simple_loop__chan_result_vld_buf = or_178 & and_146;
  assign simple_loop__chan_result_valid_load_en = simple_loop__chan_result_rdy | simple_loop__chan_result_valid_inv;
  assign ____state_1__next_value_predicates = {~____state_0, and_146, and_147};
  assign simple_loop__chan_result_not_pred = ~and_146;
  assign simple_loop__chan_result_load_en = __simple_loop__chan_result_vld_buf & simple_loop__chan_result_valid_load_en;
  assign one_hot_149 = {____state_1__next_value_predicates[2:0] == 3'h0, ____state_1__next_value_predicates[2] && ____state_1__next_value_predicates[1:0] == 2'h0, ____state_1__next_value_predicates[1] && !____state_1__next_value_predicates[0], ____state_1__next_value_predicates[0]};
  assign p0_stage_done = or_178 & (simple_loop__chan_result_not_pred | simple_loop__chan_result_load_en);
  assign simple_loop__chan_n_valid_inv = ~__simple_loop__chan_n_valid_reg;
  assign ____state_1__at_most_one_next_value = ~____state_0 == one_hot_149[2] & and_146 == one_hot_149[1] & and_147 == one_hot_149[0];
  assign concat_191 = {~____state_0 & p0_stage_done, and_146 & p0_stage_done, and_147 & p0_stage_done};
  assign add_167 = ____state_1 + 10'h001;
  assign simple_loop__chan_n_select = ~____state_0 ? __simple_loop__chan_n_reg : 10'h000;
  assign simple_loop__chan_n_valid_load_en = ~____state_0 & p0_stage_done | simple_loop__chan_n_valid_inv;
  assign nand_164 = ~(____state_0 & ugt_143);
  assign one_hot_sel_192 = add_167 & {10{concat_191[0]}} | 10'h000 & {10{concat_191[1]}} | simple_loop__chan_n_select & {10{concat_191[2]}};
  assign and_200 = (~____state_0 | and_146 | and_147) & p0_stage_done;
  assign simple_loop__chan_n_load_en = simple_loop__chan_n_vld & simple_loop__chan_n_valid_load_en;
  always @ (posedge clk) begin
    if (rst) begin
      ____state_1 <= 10'h000;
      ____state_0 <= 1'h0;
      __simple_loop__chan_n_reg <= 10'h000;
      __simple_loop__chan_n_valid_reg <= 1'h0;
      __simple_loop__chan_result_reg <= 10'h000;
      __simple_loop__chan_result_valid_reg <= 1'h0;
    end else begin
      ____state_1 <= and_200 ? one_hot_sel_192 : ____state_1;
      ____state_0 <= p0_stage_done ? nand_164 : ____state_0;
      __simple_loop__chan_n_reg <= simple_loop__chan_n_load_en ? simple_loop__chan_n : __simple_loop__chan_n_reg;
      __simple_loop__chan_n_valid_reg <= simple_loop__chan_n_valid_load_en ? simple_loop__chan_n_vld : __simple_loop__chan_n_valid_reg;
      __simple_loop__chan_result_reg <= simple_loop__chan_result_load_en ? ____state_1 : __simple_loop__chan_result_reg;
      __simple_loop__chan_result_valid_reg <= simple_loop__chan_result_valid_load_en ? __simple_loop__chan_result_vld_buf : __simple_loop__chan_result_valid_reg;
    end
  end
  assign simple_loop__chan_result = __simple_loop__chan_result_reg;
  assign simple_loop__chan_result_vld = __simple_loop__chan_result_valid_reg;
  assign simple_loop__chan_n_rdy = simple_loop__chan_n_load_en;
endmodule
