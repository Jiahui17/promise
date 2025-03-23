module __factorial__factorial_0_next(
  input wire clk,
  input wire rst,
  input wire [7:0] factorial__chan_n,
  input wire factorial__chan_n_vld,
  input wire factorial__chan_result_rdy,
  output wire [7:0] factorial__chan_result,
  output wire factorial__chan_result_vld,
  output wire factorial__chan_n_rdy
);
  // lint_off MULTIPLY
  function automatic [7:0] umul8b_8b_x_8b (input reg [7:0] lhs, input reg [7:0] rhs);
    begin
      umul8b_8b_x_8b = lhs * rhs;
    end
  endfunction
  // lint_on MULTIPLY
  reg [7:0] ____state_2 = 0;
  reg [1:0] ____state_0 = 0;
  reg [7:0] ____state_1 = 0;
  reg [7:0] __factorial__chan_n_reg = 0;
  reg __factorial__chan_n_valid_reg = 0;
  reg [7:0] __factorial__chan_result_reg = 0;
  reg __factorial__chan_result_valid_reg = 0;
  wire [1:0] LOOP1;
  wire or_reduce_453;
  wire and_reduce_454;
  wire [1:0] LOOP2;
  wire eq_457;
  wire nor_466;
  wire ugt_460;
  wire eq_463;
  wire ne_464;
  wire factorial__chan_n_not_pred;
  wire nand_471;
  wire and_467;
  wire and_473;
  wire or_547;
  wire and_475;
  wire factorial__chan_result_valid_inv;
  wire or_474;
  wire or_476;
  wire and_477;
  wire __factorial__chan_result_vld_buf;
  wire factorial__chan_result_valid_load_en;
  wire [2:0] ____state_0__next_value_predicates;
  wire [2:0] ____state_1__next_value_predicates;
  wire [3:0] ____state_2__next_value_predicates;
  wire factorial__chan_result_not_pred;
  wire factorial__chan_result_load_en;
  wire [3:0] one_hot_486;
  wire [3:0] one_hot_487;
  wire [4:0] one_hot_488;
  wire [6:0] add_484;
  wire p0_stage_done;
  wire [7:0] add_490;
  wire and_556;
  wire and_563;
  wire and_565;
  wire [7:0] umul_503;
  wire [7:0] umul_504;
  wire factorial__chan_n_valid_inv;
  wire ____state_0__at_most_one_next_value;
  wire ____state_1__at_most_one_next_value;
  wire ____state_2__at_most_one_next_value;
  wire [2:0] concat_559;
  wire [1:0] LOOP2__1;
  wire [1:0] LOOP1__1;
  wire [2:0] concat_567;
  wire [7:0] ONE;
  wire [7:0] umul_523;
  wire [3:0] concat_576;
  wire [7:0] add_527;
  wire [7:0] factorial__chan_n_select;
  wire factorial__chan_n_valid_load_en;
  wire [1:0] one_hot_sel_560;
  wire and_584;
  wire [7:0] one_hot_sel_568;
  wire and_587;
  wire [7:0] one_hot_sel_577;
  wire and_590;
  wire factorial__chan_n_load_en;
  assign LOOP1 = 2'h1;
  assign or_reduce_453 = |____state_2[7:2];
  assign and_reduce_454 = &____state_2[1:0];
  assign LOOP2 = 2'h2;
  assign eq_457 = ____state_0 == LOOP1;
  assign nor_466 = ~(____state_0[0] | ____state_0[1]);
  assign ugt_460 = ____state_2 > 8'h02;
  assign eq_463 = ____state_0 == LOOP2;
  assign ne_464 = ____state_2 != 8'h00;
  assign factorial__chan_n_not_pred = ~nor_466;
  assign nand_471 = ~(eq_463 & ne_464);
  assign and_467 = eq_457 & ugt_460;
  assign and_473 = eq_463 & ne_464;
  assign or_547 = factorial__chan_n_not_pred | __factorial__chan_n_valid_reg;
  assign and_475 = (____state_0[0] | ____state_0[1]) & ~(eq_457 & ugt_460) & ~(eq_457 & ~or_reduce_453 & ~and_reduce_454) & nand_471;
  assign factorial__chan_result_valid_inv = ~__factorial__chan_result_valid_reg;
  assign or_474 = nor_466 | and_467;
  assign or_476 = ~(~eq_457 | or_reduce_453 | and_reduce_454) | and_473;
  assign and_477 = ~eq_457 & nand_471;
  assign __factorial__chan_result_vld_buf = or_547 & and_475;
  assign factorial__chan_result_valid_load_en = factorial__chan_result_rdy | factorial__chan_result_valid_inv;
  assign ____state_0__next_value_predicates = {or_474, and_475, or_476};
  assign ____state_1__next_value_predicates = {and_467, and_477, and_473};
  assign ____state_2__next_value_predicates = {nor_466, and_467, and_475, and_473};
  assign factorial__chan_result_not_pred = ~and_475;
  assign factorial__chan_result_load_en = __factorial__chan_result_vld_buf & factorial__chan_result_valid_load_en;
  assign one_hot_486 = {____state_0__next_value_predicates[2:0] == 3'h0, ____state_0__next_value_predicates[2] && ____state_0__next_value_predicates[1:0] == 2'h0, ____state_0__next_value_predicates[1] && !____state_0__next_value_predicates[0], ____state_0__next_value_predicates[0]};
  assign one_hot_487 = {____state_1__next_value_predicates[2:0] == 3'h0, ____state_1__next_value_predicates[2] && ____state_1__next_value_predicates[1:0] == 2'h0, ____state_1__next_value_predicates[1] && !____state_1__next_value_predicates[0], ____state_1__next_value_predicates[0]};
  assign one_hot_488 = {____state_2__next_value_predicates[3:0] == 4'h0, ____state_2__next_value_predicates[3] && ____state_2__next_value_predicates[2:0] == 3'h0, ____state_2__next_value_predicates[2] && ____state_2__next_value_predicates[1:0] == 2'h0, ____state_2__next_value_predicates[1] && !____state_2__next_value_predicates[0], ____state_2__next_value_predicates[0]};
  assign add_484 = ____state_2[7:1] + 7'h7f;
  assign p0_stage_done = or_547 & (factorial__chan_result_not_pred | factorial__chan_result_load_en);
  assign add_490 = ____state_2 + 8'hff;
  assign and_556 = and_475 & p0_stage_done;
  assign and_563 = and_467 & p0_stage_done;
  assign and_565 = and_473 & p0_stage_done;
  assign umul_503 = umul8b_8b_x_8b(____state_1, ____state_2);
  assign umul_504 = umul8b_8b_x_8b(add_490, {add_484, ____state_2[0]});
  assign factorial__chan_n_valid_inv = ~__factorial__chan_n_valid_reg;
  assign ____state_0__at_most_one_next_value = or_474 == one_hot_486[2] & and_475 == one_hot_486[1] & or_476 == one_hot_486[0];
  assign ____state_1__at_most_one_next_value = and_467 == one_hot_487[2] & and_477 == one_hot_487[1] & and_473 == one_hot_487[0];
  assign ____state_2__at_most_one_next_value = nor_466 == one_hot_488[3] & and_467 == one_hot_488[2] & and_475 == one_hot_488[1] & and_473 == one_hot_488[0];
  assign concat_559 = {or_474 & p0_stage_done, and_556, or_476 & p0_stage_done};
  assign LOOP2__1 = 2'h2;
  assign LOOP1__1 = 2'h1;
  assign concat_567 = {and_563, and_477 & p0_stage_done, and_565};
  assign ONE = 8'h01;
  assign umul_523 = umul8b_8b_x_8b(umul_503, umul_504);
  assign concat_576 = {nor_466 & p0_stage_done, and_563, and_556, and_565};
  assign add_527 = ____state_2 + 8'hfd;
  assign factorial__chan_n_select = nor_466 ? __factorial__chan_n_reg : 8'h00;
  assign factorial__chan_n_valid_load_en = nor_466 & p0_stage_done | factorial__chan_n_valid_inv;
  assign one_hot_sel_560 = LOOP2__1 & {2{concat_559[0]}} | 2'h0 & {2{concat_559[1]}} | LOOP1__1 & {2{concat_559[2]}};
  assign and_584 = (or_474 | and_475 | or_476) & p0_stage_done;
  assign one_hot_sel_568 = umul_503 & {8{concat_567[0]}} | ONE & {8{concat_567[1]}} | umul_523 & {8{concat_567[2]}};
  assign and_587 = (and_467 | and_477 | and_473) & p0_stage_done;
  assign one_hot_sel_577 = add_490 & {8{concat_576[0]}} | 8'h00 & {8{concat_576[1]}} | add_527 & {8{concat_576[2]}} | factorial__chan_n_select & {8{concat_576[3]}};
  assign and_590 = (nor_466 | and_467 | and_475 | and_473) & p0_stage_done;
  assign factorial__chan_n_load_en = factorial__chan_n_vld & factorial__chan_n_valid_load_en;
  always @ (posedge clk) begin
    if (rst) begin
      ____state_2 <= 8'h00;
      ____state_0 <= 2'h0;
      ____state_1 <= 8'h01;
      __factorial__chan_n_reg <= 8'h00;
      __factorial__chan_n_valid_reg <= 1'h0;
      __factorial__chan_result_reg <= 8'h00;
      __factorial__chan_result_valid_reg <= 1'h0;
    end else begin
      ____state_2 <= and_590 ? one_hot_sel_577 : ____state_2;
      ____state_0 <= and_584 ? one_hot_sel_560 : ____state_0;
      ____state_1 <= and_587 ? one_hot_sel_568 : ____state_1;
      __factorial__chan_n_reg <= factorial__chan_n_load_en ? factorial__chan_n : __factorial__chan_n_reg;
      __factorial__chan_n_valid_reg <= factorial__chan_n_valid_load_en ? factorial__chan_n_vld : __factorial__chan_n_valid_reg;
      __factorial__chan_result_reg <= factorial__chan_result_load_en ? ____state_1 : __factorial__chan_result_reg;
      __factorial__chan_result_valid_reg <= factorial__chan_result_valid_load_en ? __factorial__chan_result_vld_buf : __factorial__chan_result_valid_reg;
    end
  end
  assign factorial__chan_result = __factorial__chan_result_reg;
  assign factorial__chan_result_vld = __factorial__chan_result_valid_reg;
  assign factorial__chan_n_rdy = factorial__chan_n_load_en;
endmodule
