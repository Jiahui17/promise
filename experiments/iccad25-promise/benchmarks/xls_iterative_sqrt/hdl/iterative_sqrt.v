module __iterative_sqrt__iterative_sqrt_0_next(
  input wire clk,
  input wire rst,
  input wire [7:0] iterative_sqrt__chan_n,
  input wire iterative_sqrt__chan_n_vld,
  input wire iterative_sqrt__chan_result_rdy,
  output wire [7:0] iterative_sqrt__chan_result,
  output wire iterative_sqrt__chan_result_vld,
  output wire iterative_sqrt__chan_n_rdy
);
  // lint_off MULTIPLY
  function automatic [7:0] umul8b_7b_x_7b (input reg [6:0] lhs, input reg [6:0] rhs);
    begin
      umul8b_7b_x_7b = lhs * rhs;
    end
  endfunction
  // lint_on MULTIPLY
  reg [7:0] ____state_2 = 0;
  reg [7:0] ____state_3 = 0;
  reg [7:0] ____state_1 = 0;
  reg ____state_0 = 0;
  reg [7:0] __iterative_sqrt__chan_n_reg = 0;
  reg __iterative_sqrt__chan_n_valid_reg = 0;
  reg [7:0] __iterative_sqrt__chan_result_reg = 0;
  reg __iterative_sqrt__chan_result_valid_reg = 0;
  wire [7:0] add_317;
  wire [7:0] umul_319;
  wire eq_321;
  wire ult_323;
  wire or_385;
  wire and_327;
  wire iterative_sqrt__chan_result_valid_inv;
  wire nand_328;
  wire nor_329;
  wire nor_330;
  wire __iterative_sqrt__chan_result_vld_buf;
  wire iterative_sqrt__chan_result_valid_load_en;
  wire [1:0] ____state_1__next_value_predicates;
  wire [1:0] ____state_2__next_value_predicates;
  wire [2:0] ____state_3__next_value_predicates;
  wire iterative_sqrt__chan_result_not_pred;
  wire iterative_sqrt__chan_result_load_en;
  wire [2:0] one_hot_334;
  wire [2:0] one_hot_335;
  wire [3:0] one_hot_336;
  wire p0_stage_done;
  wire and_394;
  wire and_395;
  wire [7:0] mid;
  wire iterative_sqrt__chan_n_valid_inv;
  wire ____state_1__at_most_one_next_value;
  wire ____state_2__at_most_one_next_value;
  wire ____state_3__at_most_one_next_value;
  wire [1:0] concat_397;
  wire [7:0] U4_ZERO__1;
  wire [7:0] iterative_sqrt__chan_n_select;
  wire [1:0] concat_404;
  wire [7:0] add_366;
  wire [7:0] U4_ZERO;
  wire [2:0] concat_412;
  wire [7:0] add_368;
  wire [7:0] U4_ZERO__2;
  wire iterative_sqrt__chan_n_valid_load_en;
  wire nand_362;
  wire [7:0] one_hot_sel_398;
  wire and_421;
  wire [7:0] one_hot_sel_405;
  wire and_424;
  wire [7:0] one_hot_sel_413;
  wire and_427;
  wire iterative_sqrt__chan_n_load_en;
  assign add_317 = ____state_2 + ____state_3;
  assign umul_319 = umul8b_7b_x_7b(add_317[7:1], add_317[7:1]);
  assign eq_321 = umul_319 == ____state_1;
  assign ult_323 = umul_319 < ____state_1;
  assign or_385 = ____state_0 | __iterative_sqrt__chan_n_valid_reg;
  assign and_327 = ____state_0 & eq_321;
  assign iterative_sqrt__chan_result_valid_inv = ~__iterative_sqrt__chan_result_valid_reg;
  assign nand_328 = ~(____state_0 & ~eq_321);
  assign nor_329 = ~(~____state_0 | eq_321 | ~ult_323);
  assign nor_330 = ~(~____state_0 | eq_321 | ult_323);
  assign __iterative_sqrt__chan_result_vld_buf = or_385 & and_327;
  assign iterative_sqrt__chan_result_valid_load_en = iterative_sqrt__chan_result_rdy | iterative_sqrt__chan_result_valid_inv;
  assign ____state_1__next_value_predicates = {~____state_0, and_327};
  assign ____state_2__next_value_predicates = {nand_328, nor_329};
  assign ____state_3__next_value_predicates = {~____state_0, and_327, nor_330};
  assign iterative_sqrt__chan_result_not_pred = ~and_327;
  assign iterative_sqrt__chan_result_load_en = __iterative_sqrt__chan_result_vld_buf & iterative_sqrt__chan_result_valid_load_en;
  assign one_hot_334 = {____state_1__next_value_predicates[1:0] == 2'h0, ____state_1__next_value_predicates[1] && !____state_1__next_value_predicates[0], ____state_1__next_value_predicates[0]};
  assign one_hot_335 = {____state_2__next_value_predicates[1:0] == 2'h0, ____state_2__next_value_predicates[1] && !____state_2__next_value_predicates[0], ____state_2__next_value_predicates[0]};
  assign one_hot_336 = {____state_3__next_value_predicates[2:0] == 3'h0, ____state_3__next_value_predicates[2] && ____state_3__next_value_predicates[1:0] == 2'h0, ____state_3__next_value_predicates[1] && !____state_3__next_value_predicates[0], ____state_3__next_value_predicates[0]};
  assign p0_stage_done = or_385 & (iterative_sqrt__chan_result_not_pred | iterative_sqrt__chan_result_load_en);
  assign and_394 = ~____state_0 & p0_stage_done;
  assign and_395 = and_327 & p0_stage_done;
  assign mid = {1'h0, add_317[7:1]};
  assign iterative_sqrt__chan_n_valid_inv = ~__iterative_sqrt__chan_n_valid_reg;
  assign ____state_1__at_most_one_next_value = ~____state_0 == one_hot_334[1] & and_327 == one_hot_334[0];
  assign ____state_2__at_most_one_next_value = nand_328 == one_hot_335[1] & nor_329 == one_hot_335[0];
  assign ____state_3__at_most_one_next_value = ~____state_0 == one_hot_336[2] & and_327 == one_hot_336[1] & nor_330 == one_hot_336[0];
  assign concat_397 = {and_394, and_395};
  assign U4_ZERO__1 = 8'h00;
  assign iterative_sqrt__chan_n_select = ~____state_0 ? __iterative_sqrt__chan_n_reg : 8'h00;
  assign concat_404 = {nand_328 & p0_stage_done, nor_329 & p0_stage_done};
  assign add_366 = mid + 8'h01;
  assign U4_ZERO = 8'h00;
  assign concat_412 = {and_394, and_395, nor_330 & p0_stage_done};
  assign add_368 = mid + 8'hff;
  assign U4_ZERO__2 = 8'h00;
  assign iterative_sqrt__chan_n_valid_load_en = ~____state_0 & p0_stage_done | iterative_sqrt__chan_n_valid_inv;
  assign nand_362 = ~(____state_0 & eq_321);
  assign one_hot_sel_398 = U4_ZERO__1 & {8{concat_397[0]}} | iterative_sqrt__chan_n_select & {8{concat_397[1]}};
  assign and_421 = (~____state_0 | and_327) & p0_stage_done;
  assign one_hot_sel_405 = add_366 & {8{concat_404[0]}} | U4_ZERO & {8{concat_404[1]}};
  assign and_424 = (nand_328 | nor_329) & p0_stage_done;
  assign one_hot_sel_413 = add_368 & {8{concat_412[0]}} | U4_ZERO__2 & {8{concat_412[1]}} | iterative_sqrt__chan_n_select & {8{concat_412[2]}};
  assign and_427 = (~____state_0 | and_327 | nor_330) & p0_stage_done;
  assign iterative_sqrt__chan_n_load_en = iterative_sqrt__chan_n_vld & iterative_sqrt__chan_n_valid_load_en;
  always @ (posedge clk) begin
    if (rst) begin
      ____state_2 <= 8'h00;
      ____state_3 <= 8'h00;
      ____state_1 <= 8'h00;
      ____state_0 <= 1'h0;
      __iterative_sqrt__chan_n_reg <= 8'h00;
      __iterative_sqrt__chan_n_valid_reg <= 1'h0;
      __iterative_sqrt__chan_result_reg <= 8'h00;
      __iterative_sqrt__chan_result_valid_reg <= 1'h0;
    end else begin
      ____state_2 <= and_424 ? one_hot_sel_405 : ____state_2;
      ____state_3 <= and_427 ? one_hot_sel_413 : ____state_3;
      ____state_1 <= and_421 ? one_hot_sel_398 : ____state_1;
      ____state_0 <= p0_stage_done ? nand_362 : ____state_0;
      __iterative_sqrt__chan_n_reg <= iterative_sqrt__chan_n_load_en ? iterative_sqrt__chan_n : __iterative_sqrt__chan_n_reg;
      __iterative_sqrt__chan_n_valid_reg <= iterative_sqrt__chan_n_valid_load_en ? iterative_sqrt__chan_n_vld : __iterative_sqrt__chan_n_valid_reg;
      __iterative_sqrt__chan_result_reg <= iterative_sqrt__chan_result_load_en ? mid : __iterative_sqrt__chan_result_reg;
      __iterative_sqrt__chan_result_valid_reg <= iterative_sqrt__chan_result_valid_load_en ? __iterative_sqrt__chan_result_vld_buf : __iterative_sqrt__chan_result_valid_reg;
    end
  end
  assign iterative_sqrt__chan_result = __iterative_sqrt__chan_result_reg;
  assign iterative_sqrt__chan_result_vld = __iterative_sqrt__chan_result_valid_reg;
  assign iterative_sqrt__chan_n_rdy = iterative_sqrt__chan_n_load_en;
endmodule
