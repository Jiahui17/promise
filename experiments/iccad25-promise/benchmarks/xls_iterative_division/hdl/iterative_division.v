module __iterative_division__iterative_division_0_next(
  input wire clk,
  input wire rst,
  input wire [7:0] iterative_division__lhs,
  input wire iterative_division__lhs_vld,
  input wire [7:0] iterative_division__rhs,
  input wire iterative_division__rhs_vld,
  input wire iterative_division__result_rdy,
  output wire [7:0] iterative_division__result,
  output wire iterative_division__result_vld,
  output wire iterative_division__lhs_rdy,
  output wire iterative_division__rhs_rdy
);
  reg ____state_2 = 0;
  reg [7:0] ____state_0 = 0;
  reg [7:0] ____state_1 = 0;
  reg [7:0] ____state_4 = 0;
  reg ____state_3 = 0;
  reg [7:0] __iterative_division__lhs_reg = 0;
  reg __iterative_division__lhs_valid_reg = 0;
  reg [7:0] __iterative_division__rhs_reg = 0;
  reg __iterative_division__rhs_valid_reg = 0;
  reg [7:0] __iterative_division__result_reg = 0;
  reg __iterative_division__result_valid_reg = 0;
  wire [7:0] iterative_division__lhs_select;
  wire [7:0] iterative_division__rhs_select;
  wire sge_408;
  wire p0_all_active_inputs_valid;
  wire nor_412;
  wire iterative_division__result_valid_inv;
  wire nor_410;
  wire nor_411;
  wire and_413;
  wire nor_414;
  wire nor_415;
  wire nand_416;
  wire __iterative_division__result_vld_buf;
  wire iterative_division__result_valid_load_en;
  wire [3:0] ____state_0__next_value_predicates;
  wire [2:0] ____state_1__next_value_predicates;
  wire [1:0] ____state_3__next_value_predicates;
  wire [1:0] ____state_4__next_value_predicates;
  wire iterative_division__result_not_pred;
  wire iterative_division__result_load_en;
  wire [4:0] one_hot_421;
  wire [3:0] one_hot_422;
  wire [2:0] one_hot_423;
  wire [2:0] one_hot_424;
  wire p0_stage_done;
  wire and_494;
  wire and_495;
  wire and_537;
  wire iterative_division__lhs_valid_inv;
  wire iterative_division__rhs_valid_inv;
  wire ____state_0__at_most_one_next_value;
  wire ____state_1__at_most_one_next_value;
  wire ____state_3__at_most_one_next_value;
  wire ____state_4__at_most_one_next_value;
  wire [3:0] concat_496;
  wire [7:0] sub_460;
  wire [2:0] concat_504;
  wire [1:0] concat_511;
  wire [1:0] concat_517;
  wire [7:0] add_456;
  wire iterative_division__lhs_valid_load_en;
  wire iterative_division__rhs_valid_load_en;
  wire [7:0] one_hot_sel_497;
  wire and_525;
  wire [7:0] one_hot_sel_505;
  wire and_528;
  wire nand_453;
  wire one_hot_sel_512;
  wire [7:0] one_hot_sel_518;
  wire and_535;
  wire iterative_division__lhs_load_en;
  wire iterative_division__rhs_load_en;
  wire [7:0] __iterative_division__result_buf;
  assign iterative_division__lhs_select = ~____state_2 ? __iterative_division__lhs_reg : 8'h00;
  assign iterative_division__rhs_select = ~____state_2 ? __iterative_division__rhs_reg : 8'h00;
  assign sge_408 = $signed(____state_0) >= $signed(____state_1);
  assign p0_all_active_inputs_valid = (____state_2 | __iterative_division__lhs_valid_reg) & (____state_2 | __iterative_division__rhs_valid_reg);
  assign nor_412 = ~(~____state_2 | sge_408);
  assign iterative_division__result_valid_inv = ~__iterative_division__result_valid_reg;
  assign nor_410 = ~(____state_2 | iterative_division__lhs_select[7]);
  assign nor_411 = ~(____state_2 | ~iterative_division__lhs_select[7]);
  assign and_413 = ____state_2 & sge_408;
  assign nor_414 = ~(____state_2 | iterative_division__rhs_select[7]);
  assign nor_415 = ~(____state_2 | ~iterative_division__rhs_select[7]);
  assign nand_416 = ~(____state_2 & sge_408);
  assign __iterative_division__result_vld_buf = p0_all_active_inputs_valid & nor_412;
  assign iterative_division__result_valid_load_en = iterative_division__result_rdy | iterative_division__result_valid_inv;
  assign ____state_0__next_value_predicates = {nor_410, nor_411, nor_412, and_413};
  assign ____state_1__next_value_predicates = {nor_414, nor_415, nor_412};
  assign ____state_3__next_value_predicates = {~____state_2, ____state_2};
  assign ____state_4__next_value_predicates = {and_413, nand_416};
  assign iterative_division__result_not_pred = ~nor_412;
  assign iterative_division__result_load_en = __iterative_division__result_vld_buf & iterative_division__result_valid_load_en;
  assign one_hot_421 = {____state_0__next_value_predicates[3:0] == 4'h0, ____state_0__next_value_predicates[3] && ____state_0__next_value_predicates[2:0] == 3'h0, ____state_0__next_value_predicates[2] && ____state_0__next_value_predicates[1:0] == 2'h0, ____state_0__next_value_predicates[1] && !____state_0__next_value_predicates[0], ____state_0__next_value_predicates[0]};
  assign one_hot_422 = {____state_1__next_value_predicates[2:0] == 3'h0, ____state_1__next_value_predicates[2] && ____state_1__next_value_predicates[1:0] == 2'h0, ____state_1__next_value_predicates[1] && !____state_1__next_value_predicates[0], ____state_1__next_value_predicates[0]};
  assign one_hot_423 = {____state_3__next_value_predicates[1:0] == 2'h0, ____state_3__next_value_predicates[1] && !____state_3__next_value_predicates[0], ____state_3__next_value_predicates[0]};
  assign one_hot_424 = {____state_4__next_value_predicates[1:0] == 2'h0, ____state_4__next_value_predicates[1] && !____state_4__next_value_predicates[0], ____state_4__next_value_predicates[0]};
  assign p0_stage_done = p0_all_active_inputs_valid & (iterative_division__result_not_pred | iterative_division__result_load_en);
  assign and_494 = nor_412 & p0_stage_done;
  assign and_495 = and_413 & p0_stage_done;
  assign and_537 = ~____state_2 & p0_stage_done;
  assign iterative_division__lhs_valid_inv = ~__iterative_division__lhs_valid_reg;
  assign iterative_division__rhs_valid_inv = ~__iterative_division__rhs_valid_reg;
  assign ____state_0__at_most_one_next_value = nor_410 == one_hot_421[3] & nor_411 == one_hot_421[2] & nor_412 == one_hot_421[1] & and_413 == one_hot_421[0];
  assign ____state_1__at_most_one_next_value = nor_414 == one_hot_422[2] & nor_415 == one_hot_422[1] & nor_412 == one_hot_422[0];
  assign ____state_3__at_most_one_next_value = ~____state_2 == one_hot_423[1] & ____state_2 == one_hot_423[0];
  assign ____state_4__at_most_one_next_value = and_413 == one_hot_424[1] & nand_416 == one_hot_424[0];
  assign concat_496 = {nor_410 & p0_stage_done, nor_411 & p0_stage_done, and_494, and_495};
  assign sub_460 = ____state_0 - ____state_1;
  assign concat_504 = {nor_414 & p0_stage_done, nor_415 & p0_stage_done, and_494};
  assign concat_511 = {~____state_2 & p0_stage_done, ____state_2 & p0_stage_done};
  assign concat_517 = {and_495, nand_416 & p0_stage_done};
  assign add_456 = ____state_4 + 8'h01;
  assign iterative_division__lhs_valid_load_en = and_537 | iterative_division__lhs_valid_inv;
  assign iterative_division__rhs_valid_load_en = and_537 | iterative_division__rhs_valid_inv;
  assign one_hot_sel_497 = sub_460 & {8{concat_496[0]}} | 8'h00 & {8{concat_496[1]}} | -iterative_division__lhs_select & {8{concat_496[2]}} | iterative_division__lhs_select & {8{concat_496[3]}};
  assign and_525 = (nor_410 | nor_411 | nor_412 | and_413) & p0_stage_done;
  assign one_hot_sel_505 = 8'h00 & {8{concat_504[0]}} | -iterative_division__rhs_select & {8{concat_504[1]}} | iterative_division__rhs_select & {8{concat_504[2]}};
  assign and_528 = (nor_414 | nor_415 | nor_412) & p0_stage_done;
  assign nand_453 = ~(____state_2 & ~sge_408);
  assign one_hot_sel_512 = sge_408 & ____state_3 & concat_511[0] | (iterative_division__lhs_select[7] ^ iterative_division__rhs_select[7]) & concat_511[1];
  assign one_hot_sel_518 = 8'h00 & {8{concat_517[0]}} | add_456 & {8{concat_517[1]}};
  assign and_535 = (and_413 | nand_416) & p0_stage_done;
  assign iterative_division__lhs_load_en = iterative_division__lhs_vld & iterative_division__lhs_valid_load_en;
  assign iterative_division__rhs_load_en = iterative_division__rhs_vld & iterative_division__rhs_valid_load_en;
  assign __iterative_division__result_buf = ____state_3 ? -____state_4 : ____state_4;
  always @ (posedge clk) begin
    if (rst) begin
      ____state_2 <= 1'h0;
      ____state_0 <= 8'h00;
      ____state_1 <= 8'h00;
      ____state_4 <= 8'h00;
      ____state_3 <= 1'h0;
      __iterative_division__lhs_reg <= 8'h00;
      __iterative_division__lhs_valid_reg <= 1'h0;
      __iterative_division__rhs_reg <= 8'h00;
      __iterative_division__rhs_valid_reg <= 1'h0;
      __iterative_division__result_reg <= 8'h00;
      __iterative_division__result_valid_reg <= 1'h0;
    end else begin
      ____state_2 <= p0_stage_done ? nand_453 : ____state_2;
      ____state_0 <= and_525 ? one_hot_sel_497 : ____state_0;
      ____state_1 <= and_528 ? one_hot_sel_505 : ____state_1;
      ____state_4 <= and_535 ? one_hot_sel_518 : ____state_4;
      ____state_3 <= p0_stage_done ? one_hot_sel_512 : ____state_3;
      __iterative_division__lhs_reg <= iterative_division__lhs_load_en ? iterative_division__lhs : __iterative_division__lhs_reg;
      __iterative_division__lhs_valid_reg <= iterative_division__lhs_valid_load_en ? iterative_division__lhs_vld : __iterative_division__lhs_valid_reg;
      __iterative_division__rhs_reg <= iterative_division__rhs_load_en ? iterative_division__rhs : __iterative_division__rhs_reg;
      __iterative_division__rhs_valid_reg <= iterative_division__rhs_valid_load_en ? iterative_division__rhs_vld : __iterative_division__rhs_valid_reg;
      __iterative_division__result_reg <= iterative_division__result_load_en ? __iterative_division__result_buf : __iterative_division__result_reg;
      __iterative_division__result_valid_reg <= iterative_division__result_valid_load_en ? __iterative_division__result_vld_buf : __iterative_division__result_valid_reg;
    end
  end
  assign iterative_division__result = __iterative_division__result_reg;
  assign iterative_division__result_vld = __iterative_division__result_valid_reg;
  assign iterative_division__lhs_rdy = iterative_division__lhs_load_en;
  assign iterative_division__rhs_rdy = iterative_division__rhs_load_en;
endmodule
